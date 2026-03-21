; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"max_f64"(i64 %a, i64 %b) nounwind {
entry:
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %t9 = load i64, ptr %local.a
  %t10 = load i64, ptr %local.b
  %t11 = call i64 @"sx_f64_gt"(i64 %t9, i64 %t10)
  %t12 = icmp ne i64 %t11, 0
  br i1 %t12, label %then1, label %else1
then1:
  %t13 = load i64, ptr %local.a
  br label %then1_end
then1_end:
  br label %endif1
else1:
  %t14 = load i64, ptr %local.b
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t15 = phi i64 [ %t13, %then1_end ], [ %t14, %else1_end ]
  ret i64 %t15
}

define i64 @"bstep"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %nu, i64 %dt, i64 %dx, i64 %i) nounwind {
entry:
  %local.um.16 = alloca i64
  %local.ui.17 = alloca i64
  %local.up.18 = alloca i64
  %local.adv.19 = alloca i64
  %local.diff.20 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %local.i = alloca i64
  store i64 %i, ptr %local.i
  %t21 = load i64, ptr %local.u4
  store i64 %t21, ptr %local.um.16
  %t22 = load i64, ptr %local.u0
  store i64 %t22, ptr %local.ui.17
  %t23 = load i64, ptr %local.u1
  store i64 %t23, ptr %local.up.18
  %t24 = load i64, ptr %local.i
  %t25 = icmp eq i64 %t24, 1
  %t26 = zext i1 %t25 to i64
  %t27 = icmp ne i64 %t26, 0
  br i1 %t27, label %then2, label %else2
then2:
  %t28 = load i64, ptr %local.u0
  store i64 %t28, ptr %local.um.16
  %t29 = load i64, ptr %local.u1
  store i64 %t29, ptr %local.ui.17
  %t30 = load i64, ptr %local.u2
  store i64 %t30, ptr %local.up.18
  br label %then2_end
then2_end:
  br label %endif2
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t31 = phi i64 [ 0, %then2_end ], [ 0, %else2_end ]
  %t32 = load i64, ptr %local.i
  %t33 = icmp eq i64 %t32, 2
  %t34 = zext i1 %t33 to i64
  %t35 = icmp ne i64 %t34, 0
  br i1 %t35, label %then3, label %else3
then3:
  %t36 = load i64, ptr %local.u1
  store i64 %t36, ptr %local.um.16
  %t37 = load i64, ptr %local.u2
  store i64 %t37, ptr %local.ui.17
  %t38 = load i64, ptr %local.u3
  store i64 %t38, ptr %local.up.18
  br label %then3_end
then3_end:
  br label %endif3
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t39 = phi i64 [ 0, %then3_end ], [ 0, %else3_end ]
  %t40 = load i64, ptr %local.i
  %t41 = icmp eq i64 %t40, 3
  %t42 = zext i1 %t41 to i64
  %t43 = icmp ne i64 %t42, 0
  br i1 %t43, label %then4, label %else4
then4:
  %t44 = load i64, ptr %local.u2
  store i64 %t44, ptr %local.um.16
  %t45 = load i64, ptr %local.u3
  store i64 %t45, ptr %local.ui.17
  %t46 = load i64, ptr %local.u4
  store i64 %t46, ptr %local.up.18
  br label %then4_end
then4_end:
  br label %endif4
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t47 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  %t48 = load i64, ptr %local.i
  %t49 = icmp eq i64 %t48, 4
  %t50 = zext i1 %t49 to i64
  %t51 = icmp ne i64 %t50, 0
  br i1 %t51, label %then5, label %else5
then5:
  %t52 = load i64, ptr %local.u3
  store i64 %t52, ptr %local.um.16
  %t53 = load i64, ptr %local.u4
  store i64 %t53, ptr %local.ui.17
  %t54 = load i64, ptr %local.u0
  store i64 %t54, ptr %local.up.18
  br label %then5_end
then5_end:
  br label %endif5
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t55 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t56 = load i64, ptr %local.ui.17
  %t57 = load i64, ptr %local.up.18
  %t58 = load i64, ptr %local.um.16
  %t59 = call i64 @"sx_f64_sub"(i64 %t57, i64 %t58)
  %t60 = call i64 @"sx_f64_mul"(i64 %t56, i64 %t59)
  %t61 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.2)
  %t62 = load i64, ptr %local.dx
  %t63 = call i64 @"sx_f64_mul"(i64 %t61, i64 %t62)
  %t64 = call i64 @"sx_f64_div"(i64 %t60, i64 %t63)
  store i64 %t64, ptr %local.adv.19
  %t65 = load i64, ptr %local.nu
  %t66 = load i64, ptr %local.up.18
  %t67 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.3)
  %t68 = load i64, ptr %local.ui.17
  %t69 = call i64 @"sx_f64_mul"(i64 %t67, i64 %t68)
  %t70 = call i64 @"sx_f64_sub"(i64 %t66, i64 %t69)
  %t71 = load i64, ptr %local.um.16
  %t72 = call i64 @"sx_f64_add"(i64 %t70, i64 %t71)
  %t73 = call i64 @"sx_f64_mul"(i64 %t65, i64 %t72)
  %t74 = load i64, ptr %local.dx
  %t75 = load i64, ptr %local.dx
  %t76 = call i64 @"sx_f64_mul"(i64 %t74, i64 %t75)
  %t77 = call i64 @"sx_f64_div"(i64 %t73, i64 %t76)
  store i64 %t77, ptr %local.diff.20
  %t78 = load i64, ptr %local.ui.17
  %t79 = load i64, ptr %local.dt
  %t80 = load i64, ptr %local.diff.20
  %t81 = load i64, ptr %local.adv.19
  %t82 = call i64 @"sx_f64_sub"(i64 %t80, i64 %t81)
  %t83 = call i64 @"sx_f64_mul"(i64 %t79, i64 %t82)
  %t84 = call i64 @"sx_f64_add"(i64 %t78, i64 %t83)
  ret i64 %t84
}

define i64 @"bstep_amplified"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %nu, i64 %gamma, i64 %dt, i64 %dx, i64 %i) nounwind {
entry:
  %local.um.85 = alloca i64
  %local.ui.86 = alloca i64
  %local.up.87 = alloca i64
  %local.adv.88 = alloca i64
  %local.diff.89 = alloca i64
  %local.grad.90 = alloca i64
  %local.stretch.91 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.gamma = alloca i64
  store i64 %gamma, ptr %local.gamma
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %local.i = alloca i64
  store i64 %i, ptr %local.i
  %t92 = load i64, ptr %local.u4
  store i64 %t92, ptr %local.um.85
  %t93 = load i64, ptr %local.u0
  store i64 %t93, ptr %local.ui.86
  %t94 = load i64, ptr %local.u1
  store i64 %t94, ptr %local.up.87
  %t95 = load i64, ptr %local.i
  %t96 = icmp eq i64 %t95, 1
  %t97 = zext i1 %t96 to i64
  %t98 = icmp ne i64 %t97, 0
  br i1 %t98, label %then6, label %else6
then6:
  %t99 = load i64, ptr %local.u0
  store i64 %t99, ptr %local.um.85
  %t100 = load i64, ptr %local.u1
  store i64 %t100, ptr %local.ui.86
  %t101 = load i64, ptr %local.u2
  store i64 %t101, ptr %local.up.87
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t102 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t103 = load i64, ptr %local.i
  %t104 = icmp eq i64 %t103, 2
  %t105 = zext i1 %t104 to i64
  %t106 = icmp ne i64 %t105, 0
  br i1 %t106, label %then7, label %else7
then7:
  %t107 = load i64, ptr %local.u1
  store i64 %t107, ptr %local.um.85
  %t108 = load i64, ptr %local.u2
  store i64 %t108, ptr %local.ui.86
  %t109 = load i64, ptr %local.u3
  store i64 %t109, ptr %local.up.87
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t110 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t111 = load i64, ptr %local.i
  %t112 = icmp eq i64 %t111, 3
  %t113 = zext i1 %t112 to i64
  %t114 = icmp ne i64 %t113, 0
  br i1 %t114, label %then8, label %else8
then8:
  %t115 = load i64, ptr %local.u2
  store i64 %t115, ptr %local.um.85
  %t116 = load i64, ptr %local.u3
  store i64 %t116, ptr %local.ui.86
  %t117 = load i64, ptr %local.u4
  store i64 %t117, ptr %local.up.87
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t118 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t119 = load i64, ptr %local.i
  %t120 = icmp eq i64 %t119, 4
  %t121 = zext i1 %t120 to i64
  %t122 = icmp ne i64 %t121, 0
  br i1 %t122, label %then9, label %else9
then9:
  %t123 = load i64, ptr %local.u3
  store i64 %t123, ptr %local.um.85
  %t124 = load i64, ptr %local.u4
  store i64 %t124, ptr %local.ui.86
  %t125 = load i64, ptr %local.u0
  store i64 %t125, ptr %local.up.87
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t126 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t127 = load i64, ptr %local.ui.86
  %t128 = load i64, ptr %local.up.87
  %t129 = load i64, ptr %local.um.85
  %t130 = call i64 @"sx_f64_sub"(i64 %t128, i64 %t129)
  %t131 = call i64 @"sx_f64_mul"(i64 %t127, i64 %t130)
  %t132 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.4)
  %t133 = load i64, ptr %local.dx
  %t134 = call i64 @"sx_f64_mul"(i64 %t132, i64 %t133)
  %t135 = call i64 @"sx_f64_div"(i64 %t131, i64 %t134)
  store i64 %t135, ptr %local.adv.88
  %t136 = load i64, ptr %local.nu
  %t137 = load i64, ptr %local.up.87
  %t138 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.5)
  %t139 = load i64, ptr %local.ui.86
  %t140 = call i64 @"sx_f64_mul"(i64 %t138, i64 %t139)
  %t141 = call i64 @"sx_f64_sub"(i64 %t137, i64 %t140)
  %t142 = load i64, ptr %local.um.85
  %t143 = call i64 @"sx_f64_add"(i64 %t141, i64 %t142)
  %t144 = call i64 @"sx_f64_mul"(i64 %t136, i64 %t143)
  %t145 = load i64, ptr %local.dx
  %t146 = load i64, ptr %local.dx
  %t147 = call i64 @"sx_f64_mul"(i64 %t145, i64 %t146)
  %t148 = call i64 @"sx_f64_div"(i64 %t144, i64 %t147)
  store i64 %t148, ptr %local.diff.89
  %t149 = load i64, ptr %local.up.87
  %t150 = load i64, ptr %local.um.85
  %t151 = call i64 @"sx_f64_sub"(i64 %t149, i64 %t150)
  %t152 = call i64 @"abs_f64"(i64 %t151)
  %t153 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.6)
  %t154 = load i64, ptr %local.dx
  %t155 = call i64 @"sx_f64_mul"(i64 %t153, i64 %t154)
  %t156 = call i64 @"sx_f64_div"(i64 %t152, i64 %t155)
  store i64 %t156, ptr %local.grad.90
  %t157 = load i64, ptr %local.gamma
  %t158 = load i64, ptr %local.ui.86
  %t159 = call i64 @"sx_f64_mul"(i64 %t157, i64 %t158)
  %t160 = load i64, ptr %local.grad.90
  %t161 = call i64 @"sx_f64_mul"(i64 %t159, i64 %t160)
  store i64 %t161, ptr %local.stretch.91
  %t162 = load i64, ptr %local.ui.86
  %t163 = load i64, ptr %local.dt
  %t164 = load i64, ptr %local.diff.89
  %t165 = load i64, ptr %local.adv.88
  %t166 = call i64 @"sx_f64_sub"(i64 %t164, i64 %t165)
  %t167 = load i64, ptr %local.stretch.91
  %t168 = call i64 @"sx_f64_add"(i64 %t166, i64 %t167)
  %t169 = call i64 @"sx_f64_mul"(i64 %t163, i64 %t168)
  %t170 = call i64 @"sx_f64_add"(i64 %t162, i64 %t169)
  ret i64 %t170
}

define i64 @"T_burgers"(i64 %amp, i64 %nu, i64 %dt, i64 %dx, i64 %max_steps, i64 %threshold) nounwind {
entry:
  %local.pi.171 = alloca i64
  %local.u0.172 = alloca i64
  %local.u1.173 = alloca i64
  %local.u2.174 = alloca i64
  %local.u3.175 = alloca i64
  %local.u4.176 = alloca i64
  %local.step.177 = alloca i64
  %local.n0.178 = alloca i64
  %local.n1.179 = alloca i64
  %local.n2.180 = alloca i64
  %local.n3.181 = alloca i64
  %local.n4.182 = alloca i64
  %local.g.183 = alloca i64
  %local.amp = alloca i64
  store i64 %amp, ptr %local.amp
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %local.max_steps = alloca i64
  store i64 %max_steps, ptr %local.max_steps
  %local.threshold = alloca i64
  store i64 %threshold, ptr %local.threshold
  %t184 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.7)
  store i64 %t184, ptr %local.pi.171
  %t185 = load i64, ptr %local.amp
  %t186 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.8)
  %t187 = load i64, ptr %local.pi.171
  %t188 = call i64 @"sx_f64_mul"(i64 %t186, i64 %t187)
  %t189 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.9)
  %t190 = call i64 @"sx_f64_mul"(i64 %t188, i64 %t189)
  %t191 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.10)
  %t192 = call i64 @"sx_f64_div"(i64 %t190, i64 %t191)
  %t193 = call i64 @"sin_f64"(i64 %t192)
  %t194 = call i64 @"sx_f64_mul"(i64 %t185, i64 %t193)
  store i64 %t194, ptr %local.u0.172
  %t195 = load i64, ptr %local.amp
  %t196 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.11)
  %t197 = load i64, ptr %local.pi.171
  %t198 = call i64 @"sx_f64_mul"(i64 %t196, i64 %t197)
  %t199 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.12)
  %t200 = call i64 @"sx_f64_mul"(i64 %t198, i64 %t199)
  %t201 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.13)
  %t202 = call i64 @"sx_f64_div"(i64 %t200, i64 %t201)
  %t203 = call i64 @"sin_f64"(i64 %t202)
  %t204 = call i64 @"sx_f64_mul"(i64 %t195, i64 %t203)
  store i64 %t204, ptr %local.u1.173
  %t205 = load i64, ptr %local.amp
  %t206 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.14)
  %t207 = load i64, ptr %local.pi.171
  %t208 = call i64 @"sx_f64_mul"(i64 %t206, i64 %t207)
  %t209 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.15)
  %t210 = call i64 @"sx_f64_mul"(i64 %t208, i64 %t209)
  %t211 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.16)
  %t212 = call i64 @"sx_f64_div"(i64 %t210, i64 %t211)
  %t213 = call i64 @"sin_f64"(i64 %t212)
  %t214 = call i64 @"sx_f64_mul"(i64 %t205, i64 %t213)
  store i64 %t214, ptr %local.u2.174
  %t215 = load i64, ptr %local.amp
  %t216 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.17)
  %t217 = load i64, ptr %local.pi.171
  %t218 = call i64 @"sx_f64_mul"(i64 %t216, i64 %t217)
  %t219 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.18)
  %t220 = call i64 @"sx_f64_mul"(i64 %t218, i64 %t219)
  %t221 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.19)
  %t222 = call i64 @"sx_f64_div"(i64 %t220, i64 %t221)
  %t223 = call i64 @"sin_f64"(i64 %t222)
  %t224 = call i64 @"sx_f64_mul"(i64 %t215, i64 %t223)
  store i64 %t224, ptr %local.u3.175
  %t225 = load i64, ptr %local.amp
  %t226 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.20)
  %t227 = load i64, ptr %local.pi.171
  %t228 = call i64 @"sx_f64_mul"(i64 %t226, i64 %t227)
  %t229 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.21)
  %t230 = call i64 @"sx_f64_mul"(i64 %t228, i64 %t229)
  %t231 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.22)
  %t232 = call i64 @"sx_f64_div"(i64 %t230, i64 %t231)
  %t233 = call i64 @"sin_f64"(i64 %t232)
  %t234 = call i64 @"sx_f64_mul"(i64 %t225, i64 %t233)
  store i64 %t234, ptr %local.u4.176
  store i64 0, ptr %local.step.177
  br label %loop10
loop10:
  %t235 = load i64, ptr %local.step.177
  %t236 = load i64, ptr %local.max_steps
  %t237 = icmp slt i64 %t235, %t236
  %t238 = zext i1 %t237 to i64
  %t239 = icmp ne i64 %t238, 0
  br i1 %t239, label %body10, label %endloop10
body10:
  %t240 = load i64, ptr %local.u0.172
  %t241 = load i64, ptr %local.u1.173
  %t242 = load i64, ptr %local.u2.174
  %t243 = load i64, ptr %local.u3.175
  %t244 = load i64, ptr %local.u4.176
  %t245 = load i64, ptr %local.nu
  %t246 = load i64, ptr %local.dt
  %t247 = load i64, ptr %local.dx
  %t248 = call i64 @"bstep"(i64 %t240, i64 %t241, i64 %t242, i64 %t243, i64 %t244, i64 %t245, i64 %t246, i64 %t247, i64 0)
  store i64 %t248, ptr %local.n0.178
  %t249 = load i64, ptr %local.u0.172
  %t250 = load i64, ptr %local.u1.173
  %t251 = load i64, ptr %local.u2.174
  %t252 = load i64, ptr %local.u3.175
  %t253 = load i64, ptr %local.u4.176
  %t254 = load i64, ptr %local.nu
  %t255 = load i64, ptr %local.dt
  %t256 = load i64, ptr %local.dx
  %t257 = call i64 @"bstep"(i64 %t249, i64 %t250, i64 %t251, i64 %t252, i64 %t253, i64 %t254, i64 %t255, i64 %t256, i64 1)
  store i64 %t257, ptr %local.n1.179
  %t258 = load i64, ptr %local.u0.172
  %t259 = load i64, ptr %local.u1.173
  %t260 = load i64, ptr %local.u2.174
  %t261 = load i64, ptr %local.u3.175
  %t262 = load i64, ptr %local.u4.176
  %t263 = load i64, ptr %local.nu
  %t264 = load i64, ptr %local.dt
  %t265 = load i64, ptr %local.dx
  %t266 = call i64 @"bstep"(i64 %t258, i64 %t259, i64 %t260, i64 %t261, i64 %t262, i64 %t263, i64 %t264, i64 %t265, i64 2)
  store i64 %t266, ptr %local.n2.180
  %t267 = load i64, ptr %local.u0.172
  %t268 = load i64, ptr %local.u1.173
  %t269 = load i64, ptr %local.u2.174
  %t270 = load i64, ptr %local.u3.175
  %t271 = load i64, ptr %local.u4.176
  %t272 = load i64, ptr %local.nu
  %t273 = load i64, ptr %local.dt
  %t274 = load i64, ptr %local.dx
  %t275 = call i64 @"bstep"(i64 %t267, i64 %t268, i64 %t269, i64 %t270, i64 %t271, i64 %t272, i64 %t273, i64 %t274, i64 3)
  store i64 %t275, ptr %local.n3.181
  %t276 = load i64, ptr %local.u0.172
  %t277 = load i64, ptr %local.u1.173
  %t278 = load i64, ptr %local.u2.174
  %t279 = load i64, ptr %local.u3.175
  %t280 = load i64, ptr %local.u4.176
  %t281 = load i64, ptr %local.nu
  %t282 = load i64, ptr %local.dt
  %t283 = load i64, ptr %local.dx
  %t284 = call i64 @"bstep"(i64 %t276, i64 %t277, i64 %t278, i64 %t279, i64 %t280, i64 %t281, i64 %t282, i64 %t283, i64 4)
  store i64 %t284, ptr %local.n4.182
  %t285 = load i64, ptr %local.n0.178
  store i64 %t285, ptr %local.u0.172
  %t286 = load i64, ptr %local.n1.179
  store i64 %t286, ptr %local.u1.173
  %t287 = load i64, ptr %local.n2.180
  store i64 %t287, ptr %local.u2.174
  %t288 = load i64, ptr %local.n3.181
  store i64 %t288, ptr %local.u3.175
  %t289 = load i64, ptr %local.n4.182
  store i64 %t289, ptr %local.u4.176
  %t290 = load i64, ptr %local.u1.173
  %t291 = load i64, ptr %local.u0.172
  %t292 = call i64 @"sx_f64_sub"(i64 %t290, i64 %t291)
  %t293 = call i64 @"abs_f64"(i64 %t292)
  %t294 = load i64, ptr %local.u2.174
  %t295 = load i64, ptr %local.u1.173
  %t296 = call i64 @"sx_f64_sub"(i64 %t294, i64 %t295)
  %t297 = call i64 @"abs_f64"(i64 %t296)
  %t298 = call i64 @"max_f64"(i64 %t293, i64 %t297)
  %t299 = load i64, ptr %local.u3.175
  %t300 = load i64, ptr %local.u2.174
  %t301 = call i64 @"sx_f64_sub"(i64 %t299, i64 %t300)
  %t302 = call i64 @"abs_f64"(i64 %t301)
  %t303 = load i64, ptr %local.u4.176
  %t304 = load i64, ptr %local.u3.175
  %t305 = call i64 @"sx_f64_sub"(i64 %t303, i64 %t304)
  %t306 = call i64 @"abs_f64"(i64 %t305)
  %t307 = call i64 @"max_f64"(i64 %t302, i64 %t306)
  %t308 = call i64 @"max_f64"(i64 %t298, i64 %t307)
  %t309 = load i64, ptr %local.dx
  %t310 = call i64 @"sx_f64_div"(i64 %t308, i64 %t309)
  store i64 %t310, ptr %local.g.183
  %t311 = load i64, ptr %local.g.183
  %t312 = load i64, ptr %local.threshold
  %t313 = call i64 @"sx_f64_gt"(i64 %t311, i64 %t312)
  %t314 = icmp ne i64 %t313, 0
  br i1 %t314, label %then11, label %else11
then11:
  %t315 = load i64, ptr %local.step.177
  %t316 = call i64 @"sx_int_to_f64"(i64 %t315)
  ret i64 %t316
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t317 = phi i64 [ 0, %else11_end ]
  %t318 = load i64, ptr %local.g.183
  %t319 = load i64, ptr %local.g.183
  %t320 = call i64 @"sx_f64_ne"(i64 %t318, i64 %t319)
  %t321 = icmp ne i64 %t320, 0
  br i1 %t321, label %then12, label %else12
then12:
  %t322 = load i64, ptr %local.step.177
  %t323 = call i64 @"sx_int_to_f64"(i64 %t322)
  ret i64 %t323
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t324 = phi i64 [ 0, %else12_end ]
  %t325 = load i64, ptr %local.step.177
  %t326 = add i64 %t325, 1
  store i64 %t326, ptr %local.step.177
  br label %loop10
endloop10:
  %t327 = load i64, ptr %local.max_steps
  %t328 = call i64 @"sx_int_to_f64"(i64 %t327)
  ret i64 %t328
}

define i64 @"T_amplified"(i64 %amp, i64 %nu, i64 %gamma, i64 %dt, i64 %dx, i64 %max_steps, i64 %threshold) nounwind {
entry:
  %local.pi.329 = alloca i64
  %local.u0.330 = alloca i64
  %local.u1.331 = alloca i64
  %local.u2.332 = alloca i64
  %local.u3.333 = alloca i64
  %local.u4.334 = alloca i64
  %local.step.335 = alloca i64
  %local.n0.336 = alloca i64
  %local.n1.337 = alloca i64
  %local.n2.338 = alloca i64
  %local.n3.339 = alloca i64
  %local.n4.340 = alloca i64
  %local.g.341 = alloca i64
  %local.amp = alloca i64
  store i64 %amp, ptr %local.amp
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.gamma = alloca i64
  store i64 %gamma, ptr %local.gamma
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %local.max_steps = alloca i64
  store i64 %max_steps, ptr %local.max_steps
  %local.threshold = alloca i64
  store i64 %threshold, ptr %local.threshold
  %t342 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.23)
  store i64 %t342, ptr %local.pi.329
  %t343 = load i64, ptr %local.amp
  %t344 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.24)
  %t345 = load i64, ptr %local.pi.329
  %t346 = call i64 @"sx_f64_mul"(i64 %t344, i64 %t345)
  %t347 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.25)
  %t348 = call i64 @"sx_f64_mul"(i64 %t346, i64 %t347)
  %t349 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.26)
  %t350 = call i64 @"sx_f64_div"(i64 %t348, i64 %t349)
  %t351 = call i64 @"sin_f64"(i64 %t350)
  %t352 = call i64 @"sx_f64_mul"(i64 %t343, i64 %t351)
  store i64 %t352, ptr %local.u0.330
  %t353 = load i64, ptr %local.amp
  %t354 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.27)
  %t355 = load i64, ptr %local.pi.329
  %t356 = call i64 @"sx_f64_mul"(i64 %t354, i64 %t355)
  %t357 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.28)
  %t358 = call i64 @"sx_f64_mul"(i64 %t356, i64 %t357)
  %t359 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.29)
  %t360 = call i64 @"sx_f64_div"(i64 %t358, i64 %t359)
  %t361 = call i64 @"sin_f64"(i64 %t360)
  %t362 = call i64 @"sx_f64_mul"(i64 %t353, i64 %t361)
  store i64 %t362, ptr %local.u1.331
  %t363 = load i64, ptr %local.amp
  %t364 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.30)
  %t365 = load i64, ptr %local.pi.329
  %t366 = call i64 @"sx_f64_mul"(i64 %t364, i64 %t365)
  %t367 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.31)
  %t368 = call i64 @"sx_f64_mul"(i64 %t366, i64 %t367)
  %t369 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.32)
  %t370 = call i64 @"sx_f64_div"(i64 %t368, i64 %t369)
  %t371 = call i64 @"sin_f64"(i64 %t370)
  %t372 = call i64 @"sx_f64_mul"(i64 %t363, i64 %t371)
  store i64 %t372, ptr %local.u2.332
  %t373 = load i64, ptr %local.amp
  %t374 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.33)
  %t375 = load i64, ptr %local.pi.329
  %t376 = call i64 @"sx_f64_mul"(i64 %t374, i64 %t375)
  %t377 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.34)
  %t378 = call i64 @"sx_f64_mul"(i64 %t376, i64 %t377)
  %t379 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.35)
  %t380 = call i64 @"sx_f64_div"(i64 %t378, i64 %t379)
  %t381 = call i64 @"sin_f64"(i64 %t380)
  %t382 = call i64 @"sx_f64_mul"(i64 %t373, i64 %t381)
  store i64 %t382, ptr %local.u3.333
  %t383 = load i64, ptr %local.amp
  %t384 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.36)
  %t385 = load i64, ptr %local.pi.329
  %t386 = call i64 @"sx_f64_mul"(i64 %t384, i64 %t385)
  %t387 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.37)
  %t388 = call i64 @"sx_f64_mul"(i64 %t386, i64 %t387)
  %t389 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.38)
  %t390 = call i64 @"sx_f64_div"(i64 %t388, i64 %t389)
  %t391 = call i64 @"sin_f64"(i64 %t390)
  %t392 = call i64 @"sx_f64_mul"(i64 %t383, i64 %t391)
  store i64 %t392, ptr %local.u4.334
  store i64 0, ptr %local.step.335
  br label %loop13
loop13:
  %t393 = load i64, ptr %local.step.335
  %t394 = load i64, ptr %local.max_steps
  %t395 = icmp slt i64 %t393, %t394
  %t396 = zext i1 %t395 to i64
  %t397 = icmp ne i64 %t396, 0
  br i1 %t397, label %body13, label %endloop13
body13:
  %t398 = load i64, ptr %local.u0.330
  %t399 = load i64, ptr %local.u1.331
  %t400 = load i64, ptr %local.u2.332
  %t401 = load i64, ptr %local.u3.333
  %t402 = load i64, ptr %local.u4.334
  %t403 = load i64, ptr %local.nu
  %t404 = load i64, ptr %local.gamma
  %t405 = load i64, ptr %local.dt
  %t406 = load i64, ptr %local.dx
  %t407 = call i64 @"bstep_amplified"(i64 %t398, i64 %t399, i64 %t400, i64 %t401, i64 %t402, i64 %t403, i64 %t404, i64 %t405, i64 %t406, i64 0)
  store i64 %t407, ptr %local.n0.336
  %t408 = load i64, ptr %local.u0.330
  %t409 = load i64, ptr %local.u1.331
  %t410 = load i64, ptr %local.u2.332
  %t411 = load i64, ptr %local.u3.333
  %t412 = load i64, ptr %local.u4.334
  %t413 = load i64, ptr %local.nu
  %t414 = load i64, ptr %local.gamma
  %t415 = load i64, ptr %local.dt
  %t416 = load i64, ptr %local.dx
  %t417 = call i64 @"bstep_amplified"(i64 %t408, i64 %t409, i64 %t410, i64 %t411, i64 %t412, i64 %t413, i64 %t414, i64 %t415, i64 %t416, i64 1)
  store i64 %t417, ptr %local.n1.337
  %t418 = load i64, ptr %local.u0.330
  %t419 = load i64, ptr %local.u1.331
  %t420 = load i64, ptr %local.u2.332
  %t421 = load i64, ptr %local.u3.333
  %t422 = load i64, ptr %local.u4.334
  %t423 = load i64, ptr %local.nu
  %t424 = load i64, ptr %local.gamma
  %t425 = load i64, ptr %local.dt
  %t426 = load i64, ptr %local.dx
  %t427 = call i64 @"bstep_amplified"(i64 %t418, i64 %t419, i64 %t420, i64 %t421, i64 %t422, i64 %t423, i64 %t424, i64 %t425, i64 %t426, i64 2)
  store i64 %t427, ptr %local.n2.338
  %t428 = load i64, ptr %local.u0.330
  %t429 = load i64, ptr %local.u1.331
  %t430 = load i64, ptr %local.u2.332
  %t431 = load i64, ptr %local.u3.333
  %t432 = load i64, ptr %local.u4.334
  %t433 = load i64, ptr %local.nu
  %t434 = load i64, ptr %local.gamma
  %t435 = load i64, ptr %local.dt
  %t436 = load i64, ptr %local.dx
  %t437 = call i64 @"bstep_amplified"(i64 %t428, i64 %t429, i64 %t430, i64 %t431, i64 %t432, i64 %t433, i64 %t434, i64 %t435, i64 %t436, i64 3)
  store i64 %t437, ptr %local.n3.339
  %t438 = load i64, ptr %local.u0.330
  %t439 = load i64, ptr %local.u1.331
  %t440 = load i64, ptr %local.u2.332
  %t441 = load i64, ptr %local.u3.333
  %t442 = load i64, ptr %local.u4.334
  %t443 = load i64, ptr %local.nu
  %t444 = load i64, ptr %local.gamma
  %t445 = load i64, ptr %local.dt
  %t446 = load i64, ptr %local.dx
  %t447 = call i64 @"bstep_amplified"(i64 %t438, i64 %t439, i64 %t440, i64 %t441, i64 %t442, i64 %t443, i64 %t444, i64 %t445, i64 %t446, i64 4)
  store i64 %t447, ptr %local.n4.340
  %t448 = load i64, ptr %local.n0.336
  store i64 %t448, ptr %local.u0.330
  %t449 = load i64, ptr %local.n1.337
  store i64 %t449, ptr %local.u1.331
  %t450 = load i64, ptr %local.n2.338
  store i64 %t450, ptr %local.u2.332
  %t451 = load i64, ptr %local.n3.339
  store i64 %t451, ptr %local.u3.333
  %t452 = load i64, ptr %local.n4.340
  store i64 %t452, ptr %local.u4.334
  %t453 = load i64, ptr %local.u1.331
  %t454 = load i64, ptr %local.u0.330
  %t455 = call i64 @"sx_f64_sub"(i64 %t453, i64 %t454)
  %t456 = call i64 @"abs_f64"(i64 %t455)
  %t457 = load i64, ptr %local.u2.332
  %t458 = load i64, ptr %local.u1.331
  %t459 = call i64 @"sx_f64_sub"(i64 %t457, i64 %t458)
  %t460 = call i64 @"abs_f64"(i64 %t459)
  %t461 = call i64 @"max_f64"(i64 %t456, i64 %t460)
  %t462 = load i64, ptr %local.u3.333
  %t463 = load i64, ptr %local.u2.332
  %t464 = call i64 @"sx_f64_sub"(i64 %t462, i64 %t463)
  %t465 = call i64 @"abs_f64"(i64 %t464)
  %t466 = load i64, ptr %local.u4.334
  %t467 = load i64, ptr %local.u3.333
  %t468 = call i64 @"sx_f64_sub"(i64 %t466, i64 %t467)
  %t469 = call i64 @"abs_f64"(i64 %t468)
  %t470 = call i64 @"max_f64"(i64 %t465, i64 %t469)
  %t471 = call i64 @"max_f64"(i64 %t461, i64 %t470)
  %t472 = load i64, ptr %local.dx
  %t473 = call i64 @"sx_f64_div"(i64 %t471, i64 %t472)
  store i64 %t473, ptr %local.g.341
  %t474 = load i64, ptr %local.g.341
  %t475 = load i64, ptr %local.threshold
  %t476 = call i64 @"sx_f64_gt"(i64 %t474, i64 %t475)
  %t477 = icmp ne i64 %t476, 0
  br i1 %t477, label %then14, label %else14
then14:
  %t478 = load i64, ptr %local.step.335
  %t479 = call i64 @"sx_int_to_f64"(i64 %t478)
  ret i64 %t479
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t480 = phi i64 [ 0, %else14_end ]
  %t481 = load i64, ptr %local.g.341
  %t482 = load i64, ptr %local.g.341
  %t483 = call i64 @"sx_f64_ne"(i64 %t481, i64 %t482)
  %t484 = icmp ne i64 %t483, 0
  br i1 %t484, label %then15, label %else15
then15:
  %t485 = load i64, ptr %local.step.335
  %t486 = call i64 @"sx_int_to_f64"(i64 %t485)
  ret i64 %t486
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t487 = phi i64 [ 0, %else15_end ]
  %t488 = load i64, ptr %local.step.335
  %t489 = add i64 %t488, 1
  store i64 %t489, ptr %local.step.335
  br label %loop13
endloop13:
  %t490 = load i64, ptr %local.max_steps
  %t491 = call i64 @"sx_int_to_f64"(i64 %t490)
  ret i64 %t491
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.dt.492 = alloca i64
  %local.dx.493 = alloca i64
  %local.threshold.494 = alloca i64
  %local.max_steps.495 = alloca i64
  %local.h.496 = alloca i64
  %local.amp.497 = alloca i64
  %local.prev_ratio.498 = alloca i64
  %local.diverging.499 = alloca i64
  %local.tb.500 = alloca i64
  %local.tp.501 = alloca i64
  %local.tm.502 = alloca i64
  %local.dtda.503 = alloca i64
  %local.ratio.504 = alloca i64
  %local.tb.505 = alloca i64
  %local.tp.506 = alloca i64
  %local.tm.507 = alloca i64
  %local.dtda.508 = alloca i64
  %local.tb.509 = alloca i64
  %local.tp.510 = alloca i64
  %local.tm.511 = alloca i64
  %local.dtda.512 = alloca i64
  %local.tb.513 = alloca i64
  %local.tp.514 = alloca i64
  %local.tm.515 = alloca i64
  %local.dtda.516 = alloca i64
  %local.r1.517 = alloca i64
  %local.r2.518 = alloca i64
  %local.r3.519 = alloca i64
  %local.r4.520 = alloca i64
  %local.tp.521 = alloca i64
  %local.tm.522 = alloca i64
  %t523 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.39)
  %t524 = ptrtoint ptr %t523 to i64
  %t525 = inttoptr i64 %t524 to ptr
  call void @intrinsic_println(ptr %t525)
  %t526 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.40)
  %t527 = ptrtoint ptr %t526 to i64
  %t528 = inttoptr i64 %t527 to ptr
  call void @intrinsic_println(ptr %t528)
  %t529 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.41)
  %t530 = ptrtoint ptr %t529 to i64
  %t531 = inttoptr i64 %t530 to ptr
  call void @intrinsic_println(ptr %t531)
  %t532 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.42)
  %t533 = ptrtoint ptr %t532 to i64
  %t534 = inttoptr i64 %t533 to ptr
  call void @intrinsic_println(ptr %t534)
  %t535 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.43)
  %t536 = ptrtoint ptr %t535 to i64
  %t537 = inttoptr i64 %t536 to ptr
  call void @intrinsic_println(ptr %t537)
  %t538 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.44)
  store i64 %t538, ptr %local.dt.492
  %t539 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.45)
  store i64 %t539, ptr %local.dx.493
  %t540 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.46)
  store i64 %t540, ptr %local.threshold.494
  store i64 100000, ptr %local.max_steps.495
  %t541 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.47)
  store i64 %t541, ptr %local.h.496
  %t542 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.48)
  %t543 = ptrtoint ptr %t542 to i64
  %t544 = inttoptr i64 %t543 to ptr
  call void @intrinsic_println(ptr %t544)
  %t545 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.49)
  %t546 = ptrtoint ptr %t545 to i64
  %t547 = inttoptr i64 %t546 to ptr
  call void @intrinsic_println(ptr %t547)
  %t548 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.50)
  %t549 = ptrtoint ptr %t548 to i64
  %t550 = inttoptr i64 %t549 to ptr
  call void @intrinsic_println(ptr %t550)
  %t551 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.51)
  %t552 = ptrtoint ptr %t551 to i64
  %t553 = inttoptr i64 %t552 to ptr
  call void @intrinsic_println(ptr %t553)
  %t554 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.52)
  %t555 = ptrtoint ptr %t554 to i64
  %t556 = inttoptr i64 %t555 to ptr
  call void @intrinsic_println(ptr %t556)
  %t557 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.53)
  store i64 %t557, ptr %local.amp.497
  %t558 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.54)
  store i64 %t558, ptr %local.prev_ratio.498
  store i64 1, ptr %local.diverging.499
  br label %loop16
loop16:
  %t559 = load i64, ptr %local.amp.497
  %t560 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.55)
  %t561 = call i64 @"sx_f64_le"(i64 %t559, i64 %t560)
  %t562 = icmp ne i64 %t561, 0
  br i1 %t562, label %body16, label %endloop16
body16:
  %t563 = load i64, ptr %local.amp.497
  %t564 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.56)
  %t565 = load i64, ptr %local.dt.492
  %t566 = load i64, ptr %local.dx.493
  %t567 = load i64, ptr %local.max_steps.495
  %t568 = load i64, ptr %local.threshold.494
  %t569 = call i64 @"T_burgers"(i64 %t563, i64 %t564, i64 %t565, i64 %t566, i64 %t567, i64 %t568)
  store i64 %t569, ptr %local.tb.500
  %t570 = load i64, ptr %local.amp.497
  %t571 = load i64, ptr %local.h.496
  %t572 = call i64 @"sx_f64_add"(i64 %t570, i64 %t571)
  %t573 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.57)
  %t574 = load i64, ptr %local.dt.492
  %t575 = load i64, ptr %local.dx.493
  %t576 = load i64, ptr %local.max_steps.495
  %t577 = load i64, ptr %local.threshold.494
  %t578 = call i64 @"T_burgers"(i64 %t572, i64 %t573, i64 %t574, i64 %t575, i64 %t576, i64 %t577)
  store i64 %t578, ptr %local.tp.501
  %t579 = load i64, ptr %local.amp.497
  %t580 = load i64, ptr %local.h.496
  %t581 = call i64 @"sx_f64_sub"(i64 %t579, i64 %t580)
  %t582 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.58)
  %t583 = load i64, ptr %local.dt.492
  %t584 = load i64, ptr %local.dx.493
  %t585 = load i64, ptr %local.max_steps.495
  %t586 = load i64, ptr %local.threshold.494
  %t587 = call i64 @"T_burgers"(i64 %t581, i64 %t582, i64 %t583, i64 %t584, i64 %t585, i64 %t586)
  store i64 %t587, ptr %local.tm.502
  %t588 = load i64, ptr %local.tp.501
  %t589 = load i64, ptr %local.tm.502
  %t590 = call i64 @"sx_f64_sub"(i64 %t588, i64 %t589)
  %t591 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.59)
  %t592 = load i64, ptr %local.h.496
  %t593 = call i64 @"sx_f64_mul"(i64 %t591, i64 %t592)
  %t594 = call i64 @"sx_f64_div"(i64 %t590, i64 %t593)
  %t595 = call i64 @"abs_f64"(i64 %t594)
  store i64 %t595, ptr %local.dtda.503
  %t596 = load i64, ptr %local.dtda.503
  %t597 = load i64, ptr %local.amp.497
  %t598 = call i64 @"sx_f64_div"(i64 %t596, i64 %t597)
  store i64 %t598, ptr %local.ratio.504
  %t599 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.60)
  %t600 = ptrtoint ptr %t599 to i64
  %t601 = inttoptr i64 %t600 to ptr
  call void @intrinsic_print(ptr %t601)
  %t602 = load i64, ptr %local.amp.497
  %t603 = call i64 @"print_f64"(i64 %t602)
  %t604 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.61)
  %t605 = ptrtoint ptr %t604 to i64
  %t606 = inttoptr i64 %t605 to ptr
  call void @intrinsic_print(ptr %t606)
  %t607 = load i64, ptr %local.tb.500
  %t608 = call i64 @"print_f64"(i64 %t607)
  %t609 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.62)
  %t610 = ptrtoint ptr %t609 to i64
  %t611 = inttoptr i64 %t610 to ptr
  call void @intrinsic_print(ptr %t611)
  %t612 = load i64, ptr %local.dtda.503
  %t613 = call i64 @"print_f64"(i64 %t612)
  %t614 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.63)
  %t615 = ptrtoint ptr %t614 to i64
  %t616 = inttoptr i64 %t615 to ptr
  call void @intrinsic_print(ptr %t616)
  %t617 = load i64, ptr %local.ratio.504
  %t618 = call i64 @"print_f64"(i64 %t617)
  %t619 = load i64, ptr %local.ratio.504
  %t620 = load i64, ptr %local.prev_ratio.498
  %t621 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.64)
  %t622 = call i64 @"sx_f64_mul"(i64 %t620, i64 %t621)
  %t623 = call i64 @"sx_f64_lt"(i64 %t619, i64 %t622)
  %t624 = icmp ne i64 %t623, 0
  br i1 %t624, label %then17, label %else17
then17:
  %t625 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.65)
  %t626 = ptrtoint ptr %t625 to i64
  %t627 = inttoptr i64 %t626 to ptr
  call void @intrinsic_println(ptr %t627)
  br label %then17_end
then17_end:
  br label %endif17
else17:
  %t628 = load i64, ptr %local.dtda.503
  %t629 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.66)
  %t630 = call i64 @"sx_f64_gt"(i64 %t628, i64 %t629)
  %t631 = icmp ne i64 %t630, 0
  br i1 %t631, label %then18, label %else18
then18:
  %t632 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.67)
  %t633 = ptrtoint ptr %t632 to i64
  %t634 = inttoptr i64 %t633 to ptr
  call void @intrinsic_println(ptr %t634)
  br label %then18_end
then18_end:
  br label %endif18
else18:
  %t635 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.68)
  %t636 = ptrtoint ptr %t635 to i64
  %t637 = inttoptr i64 %t636 to ptr
  call void @intrinsic_println(ptr %t637)
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t638 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t639 = phi i64 [ 0, %then17_end ], [ %t638, %else17_end ]
  %t640 = load i64, ptr %local.ratio.504
  store i64 %t640, ptr %local.prev_ratio.498
  %t641 = load i64, ptr %local.amp.497
  %t642 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.69)
  %t643 = call i64 @"sx_f64_mul"(i64 %t641, i64 %t642)
  store i64 %t643, ptr %local.amp.497
  br label %loop16
endloop16:
  %t644 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.70)
  %t645 = ptrtoint ptr %t644 to i64
  %t646 = inttoptr i64 %t645 to ptr
  call void @intrinsic_println(ptr %t646)
  %t647 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.71)
  %t648 = ptrtoint ptr %t647 to i64
  %t649 = inttoptr i64 %t648 to ptr
  call void @intrinsic_println(ptr %t649)
  %t650 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.72)
  %t651 = ptrtoint ptr %t650 to i64
  %t652 = inttoptr i64 %t651 to ptr
  call void @intrinsic_println(ptr %t652)
  %t653 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.73)
  %t654 = ptrtoint ptr %t653 to i64
  %t655 = inttoptr i64 %t654 to ptr
  call void @intrinsic_println(ptr %t655)
  %t656 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.74)
  %t657 = ptrtoint ptr %t656 to i64
  %t658 = inttoptr i64 %t657 to ptr
  call void @intrinsic_println(ptr %t658)
  %t659 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.75)
  store i64 %t659, ptr %local.amp.497
  br label %loop19
loop19:
  %t660 = load i64, ptr %local.amp.497
  %t661 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.76)
  %t662 = call i64 @"sx_f64_le"(i64 %t660, i64 %t661)
  %t663 = icmp ne i64 %t662, 0
  br i1 %t663, label %body19, label %endloop19
body19:
  %t664 = load i64, ptr %local.amp.497
  %t665 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.77)
  %t666 = load i64, ptr %local.dt.492
  %t667 = load i64, ptr %local.dx.493
  %t668 = load i64, ptr %local.max_steps.495
  %t669 = load i64, ptr %local.threshold.494
  %t670 = call i64 @"T_burgers"(i64 %t664, i64 %t665, i64 %t666, i64 %t667, i64 %t668, i64 %t669)
  store i64 %t670, ptr %local.tb.505
  %t671 = load i64, ptr %local.amp.497
  %t672 = load i64, ptr %local.h.496
  %t673 = call i64 @"sx_f64_add"(i64 %t671, i64 %t672)
  %t674 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.78)
  %t675 = load i64, ptr %local.dt.492
  %t676 = load i64, ptr %local.dx.493
  %t677 = load i64, ptr %local.max_steps.495
  %t678 = load i64, ptr %local.threshold.494
  %t679 = call i64 @"T_burgers"(i64 %t673, i64 %t674, i64 %t675, i64 %t676, i64 %t677, i64 %t678)
  store i64 %t679, ptr %local.tp.506
  %t680 = load i64, ptr %local.amp.497
  %t681 = load i64, ptr %local.h.496
  %t682 = call i64 @"sx_f64_sub"(i64 %t680, i64 %t681)
  %t683 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.79)
  %t684 = load i64, ptr %local.dt.492
  %t685 = load i64, ptr %local.dx.493
  %t686 = load i64, ptr %local.max_steps.495
  %t687 = load i64, ptr %local.threshold.494
  %t688 = call i64 @"T_burgers"(i64 %t682, i64 %t683, i64 %t684, i64 %t685, i64 %t686, i64 %t687)
  store i64 %t688, ptr %local.tm.507
  %t689 = load i64, ptr %local.tp.506
  %t690 = load i64, ptr %local.tm.507
  %t691 = call i64 @"sx_f64_sub"(i64 %t689, i64 %t690)
  %t692 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.80)
  %t693 = load i64, ptr %local.h.496
  %t694 = call i64 @"sx_f64_mul"(i64 %t692, i64 %t693)
  %t695 = call i64 @"sx_f64_div"(i64 %t691, i64 %t694)
  %t696 = call i64 @"abs_f64"(i64 %t695)
  store i64 %t696, ptr %local.dtda.508
  %t697 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.81)
  %t698 = ptrtoint ptr %t697 to i64
  %t699 = inttoptr i64 %t698 to ptr
  call void @intrinsic_print(ptr %t699)
  %t700 = load i64, ptr %local.amp.497
  %t701 = call i64 @"print_f64"(i64 %t700)
  %t702 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.82)
  %t703 = ptrtoint ptr %t702 to i64
  %t704 = inttoptr i64 %t703 to ptr
  call void @intrinsic_print(ptr %t704)
  %t705 = load i64, ptr %local.tb.505
  %t706 = call i64 @"print_f64"(i64 %t705)
  %t707 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.83)
  %t708 = ptrtoint ptr %t707 to i64
  %t709 = inttoptr i64 %t708 to ptr
  call void @intrinsic_print(ptr %t709)
  %t710 = load i64, ptr %local.dtda.508
  %t711 = call i64 @"print_f64"(i64 %t710)
  %t712 = load i64, ptr %local.tb.505
  %t713 = load i64, ptr %local.max_steps.495
  %t714 = call i64 @"sx_int_to_f64"(i64 %t713)
  %t715 = call i64 @"sx_f64_ge"(i64 %t712, i64 %t714)
  %t716 = icmp ne i64 %t715, 0
  br i1 %t716, label %then20, label %else20
then20:
  %t717 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.84)
  %t718 = ptrtoint ptr %t717 to i64
  %t719 = inttoptr i64 %t718 to ptr
  call void @intrinsic_println(ptr %t719)
  br label %then20_end
then20_end:
  br label %endif20
else20:
  %t720 = load i64, ptr %local.dtda.508
  %t721 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.85)
  %t722 = call i64 @"sx_f64_gt"(i64 %t720, i64 %t721)
  %t723 = icmp ne i64 %t722, 0
  br i1 %t723, label %then21, label %else21
then21:
  %t724 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.86)
  %t725 = ptrtoint ptr %t724 to i64
  %t726 = inttoptr i64 %t725 to ptr
  call void @intrinsic_println(ptr %t726)
  br label %then21_end
then21_end:
  br label %endif21
else21:
  %t727 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.87)
  %t728 = ptrtoint ptr %t727 to i64
  %t729 = inttoptr i64 %t728 to ptr
  call void @intrinsic_println(ptr %t729)
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t730 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t731 = phi i64 [ 0, %then20_end ], [ %t730, %else20_end ]
  %t732 = load i64, ptr %local.amp.497
  %t733 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.88)
  %t734 = call i64 @"sx_f64_mul"(i64 %t732, i64 %t733)
  store i64 %t734, ptr %local.amp.497
  br label %loop19
endloop19:
  %t735 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.89)
  %t736 = ptrtoint ptr %t735 to i64
  %t737 = inttoptr i64 %t736 to ptr
  call void @intrinsic_println(ptr %t737)
  %t738 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.90)
  %t739 = ptrtoint ptr %t738 to i64
  %t740 = inttoptr i64 %t739 to ptr
  call void @intrinsic_println(ptr %t740)
  %t741 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.91)
  %t742 = ptrtoint ptr %t741 to i64
  %t743 = inttoptr i64 %t742 to ptr
  call void @intrinsic_println(ptr %t743)
  %t744 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.92)
  %t745 = ptrtoint ptr %t744 to i64
  %t746 = inttoptr i64 %t745 to ptr
  call void @intrinsic_println(ptr %t746)
  %t747 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.93)
  %t748 = ptrtoint ptr %t747 to i64
  %t749 = inttoptr i64 %t748 to ptr
  call void @intrinsic_println(ptr %t749)
  %t750 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.94)
  %t751 = ptrtoint ptr %t750 to i64
  %t752 = inttoptr i64 %t751 to ptr
  call void @intrinsic_println(ptr %t752)
  %t753 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.95)
  %t754 = ptrtoint ptr %t753 to i64
  %t755 = inttoptr i64 %t754 to ptr
  call void @intrinsic_println(ptr %t755)
  %t756 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.96)
  store i64 %t756, ptr %local.amp.497
  br label %loop22
loop22:
  %t757 = load i64, ptr %local.amp.497
  %t758 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.97)
  %t759 = call i64 @"sx_f64_le"(i64 %t757, i64 %t758)
  %t760 = icmp ne i64 %t759, 0
  br i1 %t760, label %body22, label %endloop22
body22:
  %t761 = load i64, ptr %local.amp.497
  %t762 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.98)
  %t763 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.99)
  %t764 = load i64, ptr %local.dt.492
  %t765 = load i64, ptr %local.dx.493
  %t766 = load i64, ptr %local.max_steps.495
  %t767 = load i64, ptr %local.threshold.494
  %t768 = call i64 @"T_amplified"(i64 %t761, i64 %t762, i64 %t763, i64 %t764, i64 %t765, i64 %t766, i64 %t767)
  store i64 %t768, ptr %local.tb.509
  %t769 = load i64, ptr %local.amp.497
  %t770 = load i64, ptr %local.h.496
  %t771 = call i64 @"sx_f64_add"(i64 %t769, i64 %t770)
  %t772 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.100)
  %t773 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.101)
  %t774 = load i64, ptr %local.dt.492
  %t775 = load i64, ptr %local.dx.493
  %t776 = load i64, ptr %local.max_steps.495
  %t777 = load i64, ptr %local.threshold.494
  %t778 = call i64 @"T_amplified"(i64 %t771, i64 %t772, i64 %t773, i64 %t774, i64 %t775, i64 %t776, i64 %t777)
  store i64 %t778, ptr %local.tp.510
  %t779 = load i64, ptr %local.amp.497
  %t780 = load i64, ptr %local.h.496
  %t781 = call i64 @"sx_f64_sub"(i64 %t779, i64 %t780)
  %t782 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.102)
  %t783 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.103)
  %t784 = load i64, ptr %local.dt.492
  %t785 = load i64, ptr %local.dx.493
  %t786 = load i64, ptr %local.max_steps.495
  %t787 = load i64, ptr %local.threshold.494
  %t788 = call i64 @"T_amplified"(i64 %t781, i64 %t782, i64 %t783, i64 %t784, i64 %t785, i64 %t786, i64 %t787)
  store i64 %t788, ptr %local.tm.511
  %t789 = load i64, ptr %local.tp.510
  %t790 = load i64, ptr %local.tm.511
  %t791 = call i64 @"sx_f64_sub"(i64 %t789, i64 %t790)
  %t792 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.104)
  %t793 = load i64, ptr %local.h.496
  %t794 = call i64 @"sx_f64_mul"(i64 %t792, i64 %t793)
  %t795 = call i64 @"sx_f64_div"(i64 %t791, i64 %t794)
  %t796 = call i64 @"abs_f64"(i64 %t795)
  store i64 %t796, ptr %local.dtda.512
  %t797 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.105)
  %t798 = ptrtoint ptr %t797 to i64
  %t799 = inttoptr i64 %t798 to ptr
  call void @intrinsic_print(ptr %t799)
  %t800 = load i64, ptr %local.amp.497
  %t801 = call i64 @"print_f64"(i64 %t800)
  %t802 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.106)
  %t803 = ptrtoint ptr %t802 to i64
  %t804 = inttoptr i64 %t803 to ptr
  call void @intrinsic_print(ptr %t804)
  %t805 = load i64, ptr %local.tb.509
  %t806 = call i64 @"print_f64"(i64 %t805)
  %t807 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.107)
  %t808 = ptrtoint ptr %t807 to i64
  %t809 = inttoptr i64 %t808 to ptr
  call void @intrinsic_print(ptr %t809)
  %t810 = load i64, ptr %local.dtda.512
  %t811 = call i64 @"print_f64"(i64 %t810)
  %t812 = load i64, ptr %local.tb.509
  %t813 = load i64, ptr %local.max_steps.495
  %t814 = call i64 @"sx_int_to_f64"(i64 %t813)
  %t815 = call i64 @"sx_f64_ge"(i64 %t812, i64 %t814)
  %t816 = icmp ne i64 %t815, 0
  br i1 %t816, label %then23, label %else23
then23:
  %t817 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.108)
  %t818 = ptrtoint ptr %t817 to i64
  %t819 = inttoptr i64 %t818 to ptr
  call void @intrinsic_println(ptr %t819)
  br label %then23_end
then23_end:
  br label %endif23
else23:
  %t820 = load i64, ptr %local.dtda.512
  %t821 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.109)
  %t822 = call i64 @"sx_f64_gt"(i64 %t820, i64 %t821)
  %t823 = icmp ne i64 %t822, 0
  br i1 %t823, label %then24, label %else24
then24:
  %t824 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.110)
  %t825 = ptrtoint ptr %t824 to i64
  %t826 = inttoptr i64 %t825 to ptr
  call void @intrinsic_println(ptr %t826)
  br label %then24_end
then24_end:
  br label %endif24
else24:
  %t827 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.111)
  %t828 = ptrtoint ptr %t827 to i64
  %t829 = inttoptr i64 %t828 to ptr
  call void @intrinsic_println(ptr %t829)
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t830 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t831 = phi i64 [ 0, %then23_end ], [ %t830, %else23_end ]
  %t832 = load i64, ptr %local.amp.497
  %t833 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.112)
  %t834 = call i64 @"sx_f64_mul"(i64 %t832, i64 %t833)
  store i64 %t834, ptr %local.amp.497
  br label %loop22
endloop22:
  %t835 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.113)
  %t836 = ptrtoint ptr %t835 to i64
  %t837 = inttoptr i64 %t836 to ptr
  call void @intrinsic_println(ptr %t837)
  %t838 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.114)
  %t839 = ptrtoint ptr %t838 to i64
  %t840 = inttoptr i64 %t839 to ptr
  call void @intrinsic_println(ptr %t840)
  %t841 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.115)
  %t842 = ptrtoint ptr %t841 to i64
  %t843 = inttoptr i64 %t842 to ptr
  call void @intrinsic_println(ptr %t843)
  %t844 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.116)
  %t845 = ptrtoint ptr %t844 to i64
  %t846 = inttoptr i64 %t845 to ptr
  call void @intrinsic_println(ptr %t846)
  %t847 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.117)
  %t848 = ptrtoint ptr %t847 to i64
  %t849 = inttoptr i64 %t848 to ptr
  call void @intrinsic_println(ptr %t849)
  %t850 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.118)
  %t851 = ptrtoint ptr %t850 to i64
  %t852 = inttoptr i64 %t851 to ptr
  call void @intrinsic_println(ptr %t852)
  %t853 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.119)
  store i64 %t853, ptr %local.amp.497
  br label %loop25
loop25:
  %t854 = load i64, ptr %local.amp.497
  %t855 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.120)
  %t856 = call i64 @"sx_f64_le"(i64 %t854, i64 %t855)
  %t857 = icmp ne i64 %t856, 0
  br i1 %t857, label %body25, label %endloop25
body25:
  %t858 = load i64, ptr %local.amp.497
  %t859 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.121)
  %t860 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.122)
  %t861 = load i64, ptr %local.dt.492
  %t862 = load i64, ptr %local.dx.493
  %t863 = load i64, ptr %local.max_steps.495
  %t864 = load i64, ptr %local.threshold.494
  %t865 = call i64 @"T_amplified"(i64 %t858, i64 %t859, i64 %t860, i64 %t861, i64 %t862, i64 %t863, i64 %t864)
  store i64 %t865, ptr %local.tb.513
  %t866 = load i64, ptr %local.amp.497
  %t867 = load i64, ptr %local.h.496
  %t868 = call i64 @"sx_f64_add"(i64 %t866, i64 %t867)
  %t869 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.123)
  %t870 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.124)
  %t871 = load i64, ptr %local.dt.492
  %t872 = load i64, ptr %local.dx.493
  %t873 = load i64, ptr %local.max_steps.495
  %t874 = load i64, ptr %local.threshold.494
  %t875 = call i64 @"T_amplified"(i64 %t868, i64 %t869, i64 %t870, i64 %t871, i64 %t872, i64 %t873, i64 %t874)
  store i64 %t875, ptr %local.tp.514
  %t876 = load i64, ptr %local.amp.497
  %t877 = load i64, ptr %local.h.496
  %t878 = call i64 @"sx_f64_sub"(i64 %t876, i64 %t877)
  %t879 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.125)
  %t880 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.126)
  %t881 = load i64, ptr %local.dt.492
  %t882 = load i64, ptr %local.dx.493
  %t883 = load i64, ptr %local.max_steps.495
  %t884 = load i64, ptr %local.threshold.494
  %t885 = call i64 @"T_amplified"(i64 %t878, i64 %t879, i64 %t880, i64 %t881, i64 %t882, i64 %t883, i64 %t884)
  store i64 %t885, ptr %local.tm.515
  %t886 = load i64, ptr %local.tp.514
  %t887 = load i64, ptr %local.tm.515
  %t888 = call i64 @"sx_f64_sub"(i64 %t886, i64 %t887)
  %t889 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.127)
  %t890 = load i64, ptr %local.h.496
  %t891 = call i64 @"sx_f64_mul"(i64 %t889, i64 %t890)
  %t892 = call i64 @"sx_f64_div"(i64 %t888, i64 %t891)
  %t893 = call i64 @"abs_f64"(i64 %t892)
  store i64 %t893, ptr %local.dtda.516
  %t894 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.128)
  %t895 = ptrtoint ptr %t894 to i64
  %t896 = inttoptr i64 %t895 to ptr
  call void @intrinsic_print(ptr %t896)
  %t897 = load i64, ptr %local.amp.497
  %t898 = call i64 @"print_f64"(i64 %t897)
  %t899 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.129)
  %t900 = ptrtoint ptr %t899 to i64
  %t901 = inttoptr i64 %t900 to ptr
  call void @intrinsic_print(ptr %t901)
  %t902 = load i64, ptr %local.tb.513
  %t903 = call i64 @"print_f64"(i64 %t902)
  %t904 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.130)
  %t905 = ptrtoint ptr %t904 to i64
  %t906 = inttoptr i64 %t905 to ptr
  call void @intrinsic_print(ptr %t906)
  %t907 = load i64, ptr %local.dtda.516
  %t908 = call i64 @"print_f64"(i64 %t907)
  %t909 = load i64, ptr %local.tb.513
  %t910 = load i64, ptr %local.max_steps.495
  %t911 = call i64 @"sx_int_to_f64"(i64 %t910)
  %t912 = call i64 @"sx_f64_ge"(i64 %t909, i64 %t911)
  %t913 = icmp ne i64 %t912, 0
  br i1 %t913, label %then26, label %else26
then26:
  %t914 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.131)
  %t915 = ptrtoint ptr %t914 to i64
  %t916 = inttoptr i64 %t915 to ptr
  call void @intrinsic_println(ptr %t916)
  br label %then26_end
then26_end:
  br label %endif26
else26:
  %t917 = load i64, ptr %local.dtda.516
  %t918 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.132)
  %t919 = call i64 @"sx_f64_gt"(i64 %t917, i64 %t918)
  %t920 = icmp ne i64 %t919, 0
  br i1 %t920, label %then27, label %else27
then27:
  %t921 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.133)
  %t922 = ptrtoint ptr %t921 to i64
  %t923 = inttoptr i64 %t922 to ptr
  call void @intrinsic_println(ptr %t923)
  br label %then27_end
then27_end:
  br label %endif27
else27:
  %t924 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.134)
  %t925 = ptrtoint ptr %t924 to i64
  %t926 = inttoptr i64 %t925 to ptr
  call void @intrinsic_println(ptr %t926)
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t927 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t928 = phi i64 [ 0, %then26_end ], [ %t927, %else26_end ]
  %t929 = load i64, ptr %local.amp.497
  %t930 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.135)
  %t931 = call i64 @"sx_f64_mul"(i64 %t929, i64 %t930)
  store i64 %t931, ptr %local.amp.497
  br label %loop25
endloop25:
  %t932 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.136)
  %t933 = ptrtoint ptr %t932 to i64
  %t934 = inttoptr i64 %t933 to ptr
  call void @intrinsic_println(ptr %t934)
  %t935 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.137)
  %t936 = ptrtoint ptr %t935 to i64
  %t937 = inttoptr i64 %t936 to ptr
  call void @intrinsic_println(ptr %t937)
  %t938 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.138)
  %t939 = ptrtoint ptr %t938 to i64
  %t940 = inttoptr i64 %t939 to ptr
  call void @intrinsic_println(ptr %t940)
  %t941 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.139)
  %t942 = ptrtoint ptr %t941 to i64
  %t943 = inttoptr i64 %t942 to ptr
  call void @intrinsic_println(ptr %t943)
  %t944 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.140)
  %t945 = ptrtoint ptr %t944 to i64
  %t946 = inttoptr i64 %t945 to ptr
  call void @intrinsic_println(ptr %t946)
  %t947 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.141)
  %t948 = ptrtoint ptr %t947 to i64
  %t949 = inttoptr i64 %t948 to ptr
  call void @intrinsic_println(ptr %t949)
  %t950 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.142)
  %t951 = ptrtoint ptr %t950 to i64
  %t952 = inttoptr i64 %t951 to ptr
  call void @intrinsic_println(ptr %t952)
  %t953 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.143)
  %t954 = ptrtoint ptr %t953 to i64
  %t955 = inttoptr i64 %t954 to ptr
  call void @intrinsic_println(ptr %t955)
  %t956 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.144)
  store i64 %t956, ptr %local.r1.517
  %t957 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.145)
  store i64 %t957, ptr %local.r2.518
  %t958 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.146)
  store i64 %t958, ptr %local.r3.519
  %t959 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.147)
  store i64 %t959, ptr %local.r4.520
  %t960 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.148)
  store i64 %t960, ptr %local.tp.521
  %t961 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.149)
  store i64 %t961, ptr %local.tm.522
  %t962 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.150)
  %t963 = load i64, ptr %local.h.496
  %t964 = call i64 @"sx_f64_add"(i64 %t962, i64 %t963)
  %t965 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.151)
  %t966 = load i64, ptr %local.dt.492
  %t967 = load i64, ptr %local.dx.493
  %t968 = load i64, ptr %local.max_steps.495
  %t969 = load i64, ptr %local.threshold.494
  %t970 = call i64 @"T_burgers"(i64 %t964, i64 %t965, i64 %t966, i64 %t967, i64 %t968, i64 %t969)
  store i64 %t970, ptr %local.tp.521
  %t971 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.152)
  %t972 = load i64, ptr %local.h.496
  %t973 = call i64 @"sx_f64_sub"(i64 %t971, i64 %t972)
  %t974 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.153)
  %t975 = load i64, ptr %local.dt.492
  %t976 = load i64, ptr %local.dx.493
  %t977 = load i64, ptr %local.max_steps.495
  %t978 = load i64, ptr %local.threshold.494
  %t979 = call i64 @"T_burgers"(i64 %t973, i64 %t974, i64 %t975, i64 %t976, i64 %t977, i64 %t978)
  store i64 %t979, ptr %local.tm.522
  %t980 = load i64, ptr %local.tp.521
  %t981 = load i64, ptr %local.tm.522
  %t982 = call i64 @"sx_f64_sub"(i64 %t980, i64 %t981)
  %t983 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.154)
  %t984 = load i64, ptr %local.h.496
  %t985 = call i64 @"sx_f64_mul"(i64 %t983, i64 %t984)
  %t986 = call i64 @"sx_f64_div"(i64 %t982, i64 %t985)
  %t987 = call i64 @"abs_f64"(i64 %t986)
  %t988 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.155)
  %t989 = call i64 @"sx_f64_mul"(i64 %t987, i64 %t988)
  store i64 %t989, ptr %local.r1.517
  %t990 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.156)
  %t991 = load i64, ptr %local.h.496
  %t992 = call i64 @"sx_f64_add"(i64 %t990, i64 %t991)
  %t993 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.157)
  %t994 = load i64, ptr %local.dt.492
  %t995 = load i64, ptr %local.dx.493
  %t996 = load i64, ptr %local.max_steps.495
  %t997 = load i64, ptr %local.threshold.494
  %t998 = call i64 @"T_burgers"(i64 %t992, i64 %t993, i64 %t994, i64 %t995, i64 %t996, i64 %t997)
  store i64 %t998, ptr %local.tp.521
  %t999 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.158)
  %t1000 = load i64, ptr %local.h.496
  %t1001 = call i64 @"sx_f64_sub"(i64 %t999, i64 %t1000)
  %t1002 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.159)
  %t1003 = load i64, ptr %local.dt.492
  %t1004 = load i64, ptr %local.dx.493
  %t1005 = load i64, ptr %local.max_steps.495
  %t1006 = load i64, ptr %local.threshold.494
  %t1007 = call i64 @"T_burgers"(i64 %t1001, i64 %t1002, i64 %t1003, i64 %t1004, i64 %t1005, i64 %t1006)
  store i64 %t1007, ptr %local.tm.522
  %t1008 = load i64, ptr %local.tp.521
  %t1009 = load i64, ptr %local.tm.522
  %t1010 = call i64 @"sx_f64_sub"(i64 %t1008, i64 %t1009)
  %t1011 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.160)
  %t1012 = load i64, ptr %local.h.496
  %t1013 = call i64 @"sx_f64_mul"(i64 %t1011, i64 %t1012)
  %t1014 = call i64 @"sx_f64_div"(i64 %t1010, i64 %t1013)
  %t1015 = call i64 @"abs_f64"(i64 %t1014)
  %t1016 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.161)
  %t1017 = call i64 @"sx_f64_mul"(i64 %t1015, i64 %t1016)
  store i64 %t1017, ptr %local.r2.518
  %t1018 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.162)
  %t1019 = load i64, ptr %local.h.496
  %t1020 = call i64 @"sx_f64_add"(i64 %t1018, i64 %t1019)
  %t1021 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.163)
  %t1022 = load i64, ptr %local.dt.492
  %t1023 = load i64, ptr %local.dx.493
  %t1024 = load i64, ptr %local.max_steps.495
  %t1025 = load i64, ptr %local.threshold.494
  %t1026 = call i64 @"T_burgers"(i64 %t1020, i64 %t1021, i64 %t1022, i64 %t1023, i64 %t1024, i64 %t1025)
  store i64 %t1026, ptr %local.tp.521
  %t1027 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.164)
  %t1028 = load i64, ptr %local.h.496
  %t1029 = call i64 @"sx_f64_sub"(i64 %t1027, i64 %t1028)
  %t1030 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.165)
  %t1031 = load i64, ptr %local.dt.492
  %t1032 = load i64, ptr %local.dx.493
  %t1033 = load i64, ptr %local.max_steps.495
  %t1034 = load i64, ptr %local.threshold.494
  %t1035 = call i64 @"T_burgers"(i64 %t1029, i64 %t1030, i64 %t1031, i64 %t1032, i64 %t1033, i64 %t1034)
  store i64 %t1035, ptr %local.tm.522
  %t1036 = load i64, ptr %local.tp.521
  %t1037 = load i64, ptr %local.tm.522
  %t1038 = call i64 @"sx_f64_sub"(i64 %t1036, i64 %t1037)
  %t1039 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.166)
  %t1040 = load i64, ptr %local.h.496
  %t1041 = call i64 @"sx_f64_mul"(i64 %t1039, i64 %t1040)
  %t1042 = call i64 @"sx_f64_div"(i64 %t1038, i64 %t1041)
  %t1043 = call i64 @"abs_f64"(i64 %t1042)
  %t1044 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.167)
  %t1045 = call i64 @"sx_f64_mul"(i64 %t1043, i64 %t1044)
  store i64 %t1045, ptr %local.r3.519
  %t1046 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.168)
  %t1047 = load i64, ptr %local.h.496
  %t1048 = call i64 @"sx_f64_add"(i64 %t1046, i64 %t1047)
  %t1049 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.169)
  %t1050 = load i64, ptr %local.dt.492
  %t1051 = load i64, ptr %local.dx.493
  %t1052 = load i64, ptr %local.max_steps.495
  %t1053 = load i64, ptr %local.threshold.494
  %t1054 = call i64 @"T_burgers"(i64 %t1048, i64 %t1049, i64 %t1050, i64 %t1051, i64 %t1052, i64 %t1053)
  store i64 %t1054, ptr %local.tp.521
  %t1055 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.170)
  %t1056 = load i64, ptr %local.h.496
  %t1057 = call i64 @"sx_f64_sub"(i64 %t1055, i64 %t1056)
  %t1058 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.171)
  %t1059 = load i64, ptr %local.dt.492
  %t1060 = load i64, ptr %local.dx.493
  %t1061 = load i64, ptr %local.max_steps.495
  %t1062 = load i64, ptr %local.threshold.494
  %t1063 = call i64 @"T_burgers"(i64 %t1057, i64 %t1058, i64 %t1059, i64 %t1060, i64 %t1061, i64 %t1062)
  store i64 %t1063, ptr %local.tm.522
  %t1064 = load i64, ptr %local.tp.521
  %t1065 = load i64, ptr %local.tm.522
  %t1066 = call i64 @"sx_f64_sub"(i64 %t1064, i64 %t1065)
  %t1067 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.172)
  %t1068 = load i64, ptr %local.h.496
  %t1069 = call i64 @"sx_f64_mul"(i64 %t1067, i64 %t1068)
  %t1070 = call i64 @"sx_f64_div"(i64 %t1066, i64 %t1069)
  %t1071 = call i64 @"abs_f64"(i64 %t1070)
  %t1072 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.173)
  %t1073 = call i64 @"sx_f64_mul"(i64 %t1071, i64 %t1072)
  store i64 %t1073, ptr %local.r4.520
  %t1074 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.174)
  %t1075 = ptrtoint ptr %t1074 to i64
  %t1076 = inttoptr i64 %t1075 to ptr
  call void @intrinsic_print(ptr %t1076)
  %t1077 = load i64, ptr %local.r1.517
  %t1078 = call i64 @"print_f64"(i64 %t1077)
  %t1079 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.175)
  %t1080 = ptrtoint ptr %t1079 to i64
  %t1081 = inttoptr i64 %t1080 to ptr
  call void @intrinsic_print(ptr %t1081)
  %t1082 = load i64, ptr %local.r2.518
  %t1083 = call i64 @"print_f64"(i64 %t1082)
  %t1084 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.176)
  %t1085 = ptrtoint ptr %t1084 to i64
  %t1086 = inttoptr i64 %t1085 to ptr
  call void @intrinsic_print(ptr %t1086)
  %t1087 = load i64, ptr %local.r3.519
  %t1088 = call i64 @"print_f64"(i64 %t1087)
  %t1089 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.177)
  %t1090 = ptrtoint ptr %t1089 to i64
  %t1091 = inttoptr i64 %t1090 to ptr
  call void @intrinsic_print(ptr %t1091)
  %t1092 = load i64, ptr %local.r4.520
  %t1093 = call i64 @"print_f64"(i64 %t1092)
  %t1094 = load i64, ptr %local.r1.517
  %t1095 = load i64, ptr %local.r2.518
  %t1096 = call i64 @"sx_f64_gt"(i64 %t1094, i64 %t1095)
  %t1097 = icmp ne i64 %t1096, 0
  br i1 %t1097, label %then28, label %else28
then28:
  %t1098 = load i64, ptr %local.r2.518
  %t1099 = load i64, ptr %local.r3.519
  %t1100 = call i64 @"sx_f64_gt"(i64 %t1098, i64 %t1099)
  %t1101 = icmp ne i64 %t1100, 0
  br i1 %t1101, label %then29, label %else29
then29:
  %t1102 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.178)
  %t1103 = ptrtoint ptr %t1102 to i64
  %t1104 = inttoptr i64 %t1103 to ptr
  call void @intrinsic_println(ptr %t1104)
  br label %then29_end
then29_end:
  br label %endif29
else29:
  %t1105 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.179)
  %t1106 = ptrtoint ptr %t1105 to i64
  %t1107 = inttoptr i64 %t1106 to ptr
  call void @intrinsic_println(ptr %t1107)
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t1108 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  br label %then28_end
then28_end:
  br label %endif28
else28:
  %t1109 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.180)
  %t1110 = ptrtoint ptr %t1109 to i64
  %t1111 = inttoptr i64 %t1110 to ptr
  call void @intrinsic_println(ptr %t1111)
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t1112 = phi i64 [ %t1108, %then28_end ], [ 0, %else28_end ]
  %t1113 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.181)
  %t1114 = load i64, ptr %local.h.496
  %t1115 = call i64 @"sx_f64_add"(i64 %t1113, i64 %t1114)
  %t1116 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.182)
  %t1117 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.183)
  %t1118 = load i64, ptr %local.dt.492
  %t1119 = load i64, ptr %local.dx.493
  %t1120 = load i64, ptr %local.max_steps.495
  %t1121 = load i64, ptr %local.threshold.494
  %t1122 = call i64 @"T_amplified"(i64 %t1115, i64 %t1116, i64 %t1117, i64 %t1118, i64 %t1119, i64 %t1120, i64 %t1121)
  store i64 %t1122, ptr %local.tp.521
  %t1123 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.184)
  %t1124 = load i64, ptr %local.h.496
  %t1125 = call i64 @"sx_f64_sub"(i64 %t1123, i64 %t1124)
  %t1126 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.185)
  %t1127 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.186)
  %t1128 = load i64, ptr %local.dt.492
  %t1129 = load i64, ptr %local.dx.493
  %t1130 = load i64, ptr %local.max_steps.495
  %t1131 = load i64, ptr %local.threshold.494
  %t1132 = call i64 @"T_amplified"(i64 %t1125, i64 %t1126, i64 %t1127, i64 %t1128, i64 %t1129, i64 %t1130, i64 %t1131)
  store i64 %t1132, ptr %local.tm.522
  %t1133 = load i64, ptr %local.tp.521
  %t1134 = load i64, ptr %local.tm.522
  %t1135 = call i64 @"sx_f64_sub"(i64 %t1133, i64 %t1134)
  %t1136 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.187)
  %t1137 = load i64, ptr %local.h.496
  %t1138 = call i64 @"sx_f64_mul"(i64 %t1136, i64 %t1137)
  %t1139 = call i64 @"sx_f64_div"(i64 %t1135, i64 %t1138)
  %t1140 = call i64 @"abs_f64"(i64 %t1139)
  %t1141 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.188)
  %t1142 = call i64 @"sx_f64_mul"(i64 %t1140, i64 %t1141)
  store i64 %t1142, ptr %local.r1.517
  %t1143 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.189)
  %t1144 = load i64, ptr %local.h.496
  %t1145 = call i64 @"sx_f64_add"(i64 %t1143, i64 %t1144)
  %t1146 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.190)
  %t1147 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.191)
  %t1148 = load i64, ptr %local.dt.492
  %t1149 = load i64, ptr %local.dx.493
  %t1150 = load i64, ptr %local.max_steps.495
  %t1151 = load i64, ptr %local.threshold.494
  %t1152 = call i64 @"T_amplified"(i64 %t1145, i64 %t1146, i64 %t1147, i64 %t1148, i64 %t1149, i64 %t1150, i64 %t1151)
  store i64 %t1152, ptr %local.tp.521
  %t1153 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.192)
  %t1154 = load i64, ptr %local.h.496
  %t1155 = call i64 @"sx_f64_sub"(i64 %t1153, i64 %t1154)
  %t1156 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.193)
  %t1157 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.194)
  %t1158 = load i64, ptr %local.dt.492
  %t1159 = load i64, ptr %local.dx.493
  %t1160 = load i64, ptr %local.max_steps.495
  %t1161 = load i64, ptr %local.threshold.494
  %t1162 = call i64 @"T_amplified"(i64 %t1155, i64 %t1156, i64 %t1157, i64 %t1158, i64 %t1159, i64 %t1160, i64 %t1161)
  store i64 %t1162, ptr %local.tm.522
  %t1163 = load i64, ptr %local.tp.521
  %t1164 = load i64, ptr %local.tm.522
  %t1165 = call i64 @"sx_f64_sub"(i64 %t1163, i64 %t1164)
  %t1166 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.195)
  %t1167 = load i64, ptr %local.h.496
  %t1168 = call i64 @"sx_f64_mul"(i64 %t1166, i64 %t1167)
  %t1169 = call i64 @"sx_f64_div"(i64 %t1165, i64 %t1168)
  %t1170 = call i64 @"abs_f64"(i64 %t1169)
  %t1171 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.196)
  %t1172 = call i64 @"sx_f64_mul"(i64 %t1170, i64 %t1171)
  store i64 %t1172, ptr %local.r2.518
  %t1173 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.197)
  %t1174 = load i64, ptr %local.h.496
  %t1175 = call i64 @"sx_f64_add"(i64 %t1173, i64 %t1174)
  %t1176 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.198)
  %t1177 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.199)
  %t1178 = load i64, ptr %local.dt.492
  %t1179 = load i64, ptr %local.dx.493
  %t1180 = load i64, ptr %local.max_steps.495
  %t1181 = load i64, ptr %local.threshold.494
  %t1182 = call i64 @"T_amplified"(i64 %t1175, i64 %t1176, i64 %t1177, i64 %t1178, i64 %t1179, i64 %t1180, i64 %t1181)
  store i64 %t1182, ptr %local.tp.521
  %t1183 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.200)
  %t1184 = load i64, ptr %local.h.496
  %t1185 = call i64 @"sx_f64_sub"(i64 %t1183, i64 %t1184)
  %t1186 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.201)
  %t1187 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.202)
  %t1188 = load i64, ptr %local.dt.492
  %t1189 = load i64, ptr %local.dx.493
  %t1190 = load i64, ptr %local.max_steps.495
  %t1191 = load i64, ptr %local.threshold.494
  %t1192 = call i64 @"T_amplified"(i64 %t1185, i64 %t1186, i64 %t1187, i64 %t1188, i64 %t1189, i64 %t1190, i64 %t1191)
  store i64 %t1192, ptr %local.tm.522
  %t1193 = load i64, ptr %local.tp.521
  %t1194 = load i64, ptr %local.tm.522
  %t1195 = call i64 @"sx_f64_sub"(i64 %t1193, i64 %t1194)
  %t1196 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.203)
  %t1197 = load i64, ptr %local.h.496
  %t1198 = call i64 @"sx_f64_mul"(i64 %t1196, i64 %t1197)
  %t1199 = call i64 @"sx_f64_div"(i64 %t1195, i64 %t1198)
  %t1200 = call i64 @"abs_f64"(i64 %t1199)
  %t1201 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.204)
  %t1202 = call i64 @"sx_f64_mul"(i64 %t1200, i64 %t1201)
  store i64 %t1202, ptr %local.r3.519
  %t1203 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.205)
  %t1204 = load i64, ptr %local.h.496
  %t1205 = call i64 @"sx_f64_add"(i64 %t1203, i64 %t1204)
  %t1206 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.206)
  %t1207 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.207)
  %t1208 = load i64, ptr %local.dt.492
  %t1209 = load i64, ptr %local.dx.493
  %t1210 = load i64, ptr %local.max_steps.495
  %t1211 = load i64, ptr %local.threshold.494
  %t1212 = call i64 @"T_amplified"(i64 %t1205, i64 %t1206, i64 %t1207, i64 %t1208, i64 %t1209, i64 %t1210, i64 %t1211)
  store i64 %t1212, ptr %local.tp.521
  %t1213 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.208)
  %t1214 = load i64, ptr %local.h.496
  %t1215 = call i64 @"sx_f64_sub"(i64 %t1213, i64 %t1214)
  %t1216 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.209)
  %t1217 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.210)
  %t1218 = load i64, ptr %local.dt.492
  %t1219 = load i64, ptr %local.dx.493
  %t1220 = load i64, ptr %local.max_steps.495
  %t1221 = load i64, ptr %local.threshold.494
  %t1222 = call i64 @"T_amplified"(i64 %t1215, i64 %t1216, i64 %t1217, i64 %t1218, i64 %t1219, i64 %t1220, i64 %t1221)
  store i64 %t1222, ptr %local.tm.522
  %t1223 = load i64, ptr %local.tp.521
  %t1224 = load i64, ptr %local.tm.522
  %t1225 = call i64 @"sx_f64_sub"(i64 %t1223, i64 %t1224)
  %t1226 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.211)
  %t1227 = load i64, ptr %local.h.496
  %t1228 = call i64 @"sx_f64_mul"(i64 %t1226, i64 %t1227)
  %t1229 = call i64 @"sx_f64_div"(i64 %t1225, i64 %t1228)
  %t1230 = call i64 @"abs_f64"(i64 %t1229)
  %t1231 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.212)
  %t1232 = call i64 @"sx_f64_mul"(i64 %t1230, i64 %t1231)
  store i64 %t1232, ptr %local.r4.520
  %t1233 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.213)
  %t1234 = ptrtoint ptr %t1233 to i64
  %t1235 = inttoptr i64 %t1234 to ptr
  call void @intrinsic_print(ptr %t1235)
  %t1236 = load i64, ptr %local.r1.517
  %t1237 = call i64 @"print_f64"(i64 %t1236)
  %t1238 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.214)
  %t1239 = ptrtoint ptr %t1238 to i64
  %t1240 = inttoptr i64 %t1239 to ptr
  call void @intrinsic_print(ptr %t1240)
  %t1241 = load i64, ptr %local.r2.518
  %t1242 = call i64 @"print_f64"(i64 %t1241)
  %t1243 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.215)
  %t1244 = ptrtoint ptr %t1243 to i64
  %t1245 = inttoptr i64 %t1244 to ptr
  call void @intrinsic_print(ptr %t1245)
  %t1246 = load i64, ptr %local.r3.519
  %t1247 = call i64 @"print_f64"(i64 %t1246)
  %t1248 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.216)
  %t1249 = ptrtoint ptr %t1248 to i64
  %t1250 = inttoptr i64 %t1249 to ptr
  call void @intrinsic_print(ptr %t1250)
  %t1251 = load i64, ptr %local.r4.520
  %t1252 = call i64 @"print_f64"(i64 %t1251)
  %t1253 = load i64, ptr %local.r1.517
  %t1254 = load i64, ptr %local.r2.518
  %t1255 = call i64 @"sx_f64_gt"(i64 %t1253, i64 %t1254)
  %t1256 = icmp ne i64 %t1255, 0
  br i1 %t1256, label %then30, label %else30
then30:
  %t1257 = load i64, ptr %local.r2.518
  %t1258 = load i64, ptr %local.r3.519
  %t1259 = call i64 @"sx_f64_gt"(i64 %t1257, i64 %t1258)
  %t1260 = icmp ne i64 %t1259, 0
  br i1 %t1260, label %then31, label %else31
then31:
  %t1261 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.217)
  %t1262 = ptrtoint ptr %t1261 to i64
  %t1263 = inttoptr i64 %t1262 to ptr
  call void @intrinsic_println(ptr %t1263)
  br label %then31_end
then31_end:
  br label %endif31
else31:
  %t1264 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.218)
  %t1265 = ptrtoint ptr %t1264 to i64
  %t1266 = inttoptr i64 %t1265 to ptr
  call void @intrinsic_println(ptr %t1266)
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t1267 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  br label %then30_end
then30_end:
  br label %endif30
else30:
  %t1268 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.219)
  %t1269 = ptrtoint ptr %t1268 to i64
  %t1270 = inttoptr i64 %t1269 to ptr
  call void @intrinsic_println(ptr %t1270)
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t1271 = phi i64 [ %t1267, %then30_end ], [ 0, %else30_end ]
  %t1272 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.220)
  %t1273 = load i64, ptr %local.h.496
  %t1274 = call i64 @"sx_f64_add"(i64 %t1272, i64 %t1273)
  %t1275 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.221)
  %t1276 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.222)
  %t1277 = load i64, ptr %local.dt.492
  %t1278 = load i64, ptr %local.dx.493
  %t1279 = load i64, ptr %local.max_steps.495
  %t1280 = load i64, ptr %local.threshold.494
  %t1281 = call i64 @"T_amplified"(i64 %t1274, i64 %t1275, i64 %t1276, i64 %t1277, i64 %t1278, i64 %t1279, i64 %t1280)
  store i64 %t1281, ptr %local.tp.521
  %t1282 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.223)
  %t1283 = load i64, ptr %local.h.496
  %t1284 = call i64 @"sx_f64_sub"(i64 %t1282, i64 %t1283)
  %t1285 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.224)
  %t1286 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.225)
  %t1287 = load i64, ptr %local.dt.492
  %t1288 = load i64, ptr %local.dx.493
  %t1289 = load i64, ptr %local.max_steps.495
  %t1290 = load i64, ptr %local.threshold.494
  %t1291 = call i64 @"T_amplified"(i64 %t1284, i64 %t1285, i64 %t1286, i64 %t1287, i64 %t1288, i64 %t1289, i64 %t1290)
  store i64 %t1291, ptr %local.tm.522
  %t1292 = load i64, ptr %local.tp.521
  %t1293 = load i64, ptr %local.tm.522
  %t1294 = call i64 @"sx_f64_sub"(i64 %t1292, i64 %t1293)
  %t1295 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.226)
  %t1296 = load i64, ptr %local.h.496
  %t1297 = call i64 @"sx_f64_mul"(i64 %t1295, i64 %t1296)
  %t1298 = call i64 @"sx_f64_div"(i64 %t1294, i64 %t1297)
  %t1299 = call i64 @"abs_f64"(i64 %t1298)
  %t1300 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.227)
  %t1301 = call i64 @"sx_f64_mul"(i64 %t1299, i64 %t1300)
  store i64 %t1301, ptr %local.r1.517
  %t1302 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.228)
  %t1303 = load i64, ptr %local.h.496
  %t1304 = call i64 @"sx_f64_add"(i64 %t1302, i64 %t1303)
  %t1305 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.229)
  %t1306 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.230)
  %t1307 = load i64, ptr %local.dt.492
  %t1308 = load i64, ptr %local.dx.493
  %t1309 = load i64, ptr %local.max_steps.495
  %t1310 = load i64, ptr %local.threshold.494
  %t1311 = call i64 @"T_amplified"(i64 %t1304, i64 %t1305, i64 %t1306, i64 %t1307, i64 %t1308, i64 %t1309, i64 %t1310)
  store i64 %t1311, ptr %local.tp.521
  %t1312 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.231)
  %t1313 = load i64, ptr %local.h.496
  %t1314 = call i64 @"sx_f64_sub"(i64 %t1312, i64 %t1313)
  %t1315 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.232)
  %t1316 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.233)
  %t1317 = load i64, ptr %local.dt.492
  %t1318 = load i64, ptr %local.dx.493
  %t1319 = load i64, ptr %local.max_steps.495
  %t1320 = load i64, ptr %local.threshold.494
  %t1321 = call i64 @"T_amplified"(i64 %t1314, i64 %t1315, i64 %t1316, i64 %t1317, i64 %t1318, i64 %t1319, i64 %t1320)
  store i64 %t1321, ptr %local.tm.522
  %t1322 = load i64, ptr %local.tp.521
  %t1323 = load i64, ptr %local.tm.522
  %t1324 = call i64 @"sx_f64_sub"(i64 %t1322, i64 %t1323)
  %t1325 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.234)
  %t1326 = load i64, ptr %local.h.496
  %t1327 = call i64 @"sx_f64_mul"(i64 %t1325, i64 %t1326)
  %t1328 = call i64 @"sx_f64_div"(i64 %t1324, i64 %t1327)
  %t1329 = call i64 @"abs_f64"(i64 %t1328)
  %t1330 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.235)
  %t1331 = call i64 @"sx_f64_mul"(i64 %t1329, i64 %t1330)
  store i64 %t1331, ptr %local.r2.518
  %t1332 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.236)
  %t1333 = load i64, ptr %local.h.496
  %t1334 = call i64 @"sx_f64_add"(i64 %t1332, i64 %t1333)
  %t1335 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.237)
  %t1336 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.238)
  %t1337 = load i64, ptr %local.dt.492
  %t1338 = load i64, ptr %local.dx.493
  %t1339 = load i64, ptr %local.max_steps.495
  %t1340 = load i64, ptr %local.threshold.494
  %t1341 = call i64 @"T_amplified"(i64 %t1334, i64 %t1335, i64 %t1336, i64 %t1337, i64 %t1338, i64 %t1339, i64 %t1340)
  store i64 %t1341, ptr %local.tp.521
  %t1342 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.239)
  %t1343 = load i64, ptr %local.h.496
  %t1344 = call i64 @"sx_f64_sub"(i64 %t1342, i64 %t1343)
  %t1345 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.240)
  %t1346 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.241)
  %t1347 = load i64, ptr %local.dt.492
  %t1348 = load i64, ptr %local.dx.493
  %t1349 = load i64, ptr %local.max_steps.495
  %t1350 = load i64, ptr %local.threshold.494
  %t1351 = call i64 @"T_amplified"(i64 %t1344, i64 %t1345, i64 %t1346, i64 %t1347, i64 %t1348, i64 %t1349, i64 %t1350)
  store i64 %t1351, ptr %local.tm.522
  %t1352 = load i64, ptr %local.tp.521
  %t1353 = load i64, ptr %local.tm.522
  %t1354 = call i64 @"sx_f64_sub"(i64 %t1352, i64 %t1353)
  %t1355 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.242)
  %t1356 = load i64, ptr %local.h.496
  %t1357 = call i64 @"sx_f64_mul"(i64 %t1355, i64 %t1356)
  %t1358 = call i64 @"sx_f64_div"(i64 %t1354, i64 %t1357)
  %t1359 = call i64 @"abs_f64"(i64 %t1358)
  %t1360 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.243)
  %t1361 = call i64 @"sx_f64_mul"(i64 %t1359, i64 %t1360)
  store i64 %t1361, ptr %local.r3.519
  %t1362 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.244)
  %t1363 = load i64, ptr %local.h.496
  %t1364 = call i64 @"sx_f64_add"(i64 %t1362, i64 %t1363)
  %t1365 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.245)
  %t1366 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.246)
  %t1367 = load i64, ptr %local.dt.492
  %t1368 = load i64, ptr %local.dx.493
  %t1369 = load i64, ptr %local.max_steps.495
  %t1370 = load i64, ptr %local.threshold.494
  %t1371 = call i64 @"T_amplified"(i64 %t1364, i64 %t1365, i64 %t1366, i64 %t1367, i64 %t1368, i64 %t1369, i64 %t1370)
  store i64 %t1371, ptr %local.tp.521
  %t1372 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.247)
  %t1373 = load i64, ptr %local.h.496
  %t1374 = call i64 @"sx_f64_sub"(i64 %t1372, i64 %t1373)
  %t1375 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.248)
  %t1376 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.249)
  %t1377 = load i64, ptr %local.dt.492
  %t1378 = load i64, ptr %local.dx.493
  %t1379 = load i64, ptr %local.max_steps.495
  %t1380 = load i64, ptr %local.threshold.494
  %t1381 = call i64 @"T_amplified"(i64 %t1374, i64 %t1375, i64 %t1376, i64 %t1377, i64 %t1378, i64 %t1379, i64 %t1380)
  store i64 %t1381, ptr %local.tm.522
  %t1382 = load i64, ptr %local.tp.521
  %t1383 = load i64, ptr %local.tm.522
  %t1384 = call i64 @"sx_f64_sub"(i64 %t1382, i64 %t1383)
  %t1385 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.250)
  %t1386 = load i64, ptr %local.h.496
  %t1387 = call i64 @"sx_f64_mul"(i64 %t1385, i64 %t1386)
  %t1388 = call i64 @"sx_f64_div"(i64 %t1384, i64 %t1387)
  %t1389 = call i64 @"abs_f64"(i64 %t1388)
  %t1390 = call i64 @f64_parse(ptr @.str.exp_ns_regularity.251)
  %t1391 = call i64 @"sx_f64_mul"(i64 %t1389, i64 %t1390)
  store i64 %t1391, ptr %local.r4.520
  %t1392 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.252)
  %t1393 = ptrtoint ptr %t1392 to i64
  %t1394 = inttoptr i64 %t1393 to ptr
  call void @intrinsic_print(ptr %t1394)
  %t1395 = load i64, ptr %local.r1.517
  %t1396 = call i64 @"print_f64"(i64 %t1395)
  %t1397 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.253)
  %t1398 = ptrtoint ptr %t1397 to i64
  %t1399 = inttoptr i64 %t1398 to ptr
  call void @intrinsic_print(ptr %t1399)
  %t1400 = load i64, ptr %local.r2.518
  %t1401 = call i64 @"print_f64"(i64 %t1400)
  %t1402 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.254)
  %t1403 = ptrtoint ptr %t1402 to i64
  %t1404 = inttoptr i64 %t1403 to ptr
  call void @intrinsic_print(ptr %t1404)
  %t1405 = load i64, ptr %local.r3.519
  %t1406 = call i64 @"print_f64"(i64 %t1405)
  %t1407 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.255)
  %t1408 = ptrtoint ptr %t1407 to i64
  %t1409 = inttoptr i64 %t1408 to ptr
  call void @intrinsic_print(ptr %t1409)
  %t1410 = load i64, ptr %local.r4.520
  %t1411 = call i64 @"print_f64"(i64 %t1410)
  %t1412 = load i64, ptr %local.r1.517
  %t1413 = load i64, ptr %local.r2.518
  %t1414 = call i64 @"sx_f64_gt"(i64 %t1412, i64 %t1413)
  %t1415 = icmp ne i64 %t1414, 0
  br i1 %t1415, label %then32, label %else32
then32:
  %t1416 = load i64, ptr %local.r2.518
  %t1417 = load i64, ptr %local.r3.519
  %t1418 = call i64 @"sx_f64_gt"(i64 %t1416, i64 %t1417)
  %t1419 = icmp ne i64 %t1418, 0
  br i1 %t1419, label %then33, label %else33
then33:
  %t1420 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.256)
  %t1421 = ptrtoint ptr %t1420 to i64
  %t1422 = inttoptr i64 %t1421 to ptr
  call void @intrinsic_println(ptr %t1422)
  br label %then33_end
then33_end:
  br label %endif33
else33:
  %t1423 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.257)
  %t1424 = ptrtoint ptr %t1423 to i64
  %t1425 = inttoptr i64 %t1424 to ptr
  call void @intrinsic_println(ptr %t1425)
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t1426 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  br label %then32_end
then32_end:
  br label %endif32
else32:
  %t1427 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.258)
  %t1428 = ptrtoint ptr %t1427 to i64
  %t1429 = inttoptr i64 %t1428 to ptr
  call void @intrinsic_println(ptr %t1429)
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t1430 = phi i64 [ %t1426, %then32_end ], [ 0, %else32_end ]
  %t1431 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.259)
  %t1432 = ptrtoint ptr %t1431 to i64
  %t1433 = inttoptr i64 %t1432 to ptr
  call void @intrinsic_println(ptr %t1433)
  %t1434 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.260)
  %t1435 = ptrtoint ptr %t1434 to i64
  %t1436 = inttoptr i64 %t1435 to ptr
  call void @intrinsic_println(ptr %t1436)
  %t1437 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.261)
  %t1438 = ptrtoint ptr %t1437 to i64
  %t1439 = inttoptr i64 %t1438 to ptr
  call void @intrinsic_println(ptr %t1439)
  %t1440 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.262)
  %t1441 = ptrtoint ptr %t1440 to i64
  %t1442 = inttoptr i64 %t1441 to ptr
  call void @intrinsic_println(ptr %t1442)
  %t1443 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.263)
  %t1444 = ptrtoint ptr %t1443 to i64
  %t1445 = inttoptr i64 %t1444 to ptr
  call void @intrinsic_println(ptr %t1445)
  %t1446 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.264)
  %t1447 = ptrtoint ptr %t1446 to i64
  %t1448 = inttoptr i64 %t1447 to ptr
  call void @intrinsic_println(ptr %t1448)
  %t1449 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.265)
  %t1450 = ptrtoint ptr %t1449 to i64
  %t1451 = inttoptr i64 %t1450 to ptr
  call void @intrinsic_println(ptr %t1451)
  %t1452 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.266)
  %t1453 = ptrtoint ptr %t1452 to i64
  %t1454 = inttoptr i64 %t1453 to ptr
  call void @intrinsic_println(ptr %t1454)
  %t1455 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.267)
  %t1456 = ptrtoint ptr %t1455 to i64
  %t1457 = inttoptr i64 %t1456 to ptr
  call void @intrinsic_println(ptr %t1457)
  %t1458 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.268)
  %t1459 = ptrtoint ptr %t1458 to i64
  %t1460 = inttoptr i64 %t1459 to ptr
  call void @intrinsic_println(ptr %t1460)
  %t1461 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.269)
  %t1462 = ptrtoint ptr %t1461 to i64
  %t1463 = inttoptr i64 %t1462 to ptr
  call void @intrinsic_println(ptr %t1463)
  %t1464 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.270)
  %t1465 = ptrtoint ptr %t1464 to i64
  %t1466 = inttoptr i64 %t1465 to ptr
  call void @intrinsic_println(ptr %t1466)
  %t1467 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.271)
  %t1468 = ptrtoint ptr %t1467 to i64
  %t1469 = inttoptr i64 %t1468 to ptr
  call void @intrinsic_println(ptr %t1469)
  %t1470 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.272)
  %t1471 = ptrtoint ptr %t1470 to i64
  %t1472 = inttoptr i64 %t1471 to ptr
  call void @intrinsic_println(ptr %t1472)
  %t1473 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.273)
  %t1474 = ptrtoint ptr %t1473 to i64
  %t1475 = inttoptr i64 %t1474 to ptr
  call void @intrinsic_println(ptr %t1475)
  %t1476 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.274)
  %t1477 = ptrtoint ptr %t1476 to i64
  %t1478 = inttoptr i64 %t1477 to ptr
  call void @intrinsic_println(ptr %t1478)
  %t1479 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.275)
  %t1480 = ptrtoint ptr %t1479 to i64
  %t1481 = inttoptr i64 %t1480 to ptr
  call void @intrinsic_println(ptr %t1481)
  %t1482 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.276)
  %t1483 = ptrtoint ptr %t1482 to i64
  %t1484 = inttoptr i64 %t1483 to ptr
  call void @intrinsic_println(ptr %t1484)
  %t1485 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.277)
  %t1486 = ptrtoint ptr %t1485 to i64
  %t1487 = inttoptr i64 %t1486 to ptr
  call void @intrinsic_println(ptr %t1487)
  %t1488 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.278)
  %t1489 = ptrtoint ptr %t1488 to i64
  %t1490 = inttoptr i64 %t1489 to ptr
  call void @intrinsic_println(ptr %t1490)
  %t1491 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.279)
  %t1492 = ptrtoint ptr %t1491 to i64
  %t1493 = inttoptr i64 %t1492 to ptr
  call void @intrinsic_println(ptr %t1493)
  %t1494 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_regularity.280)
  %t1495 = ptrtoint ptr %t1494 to i64
  %t1496 = inttoptr i64 %t1495 to ptr
  call void @intrinsic_println(ptr %t1496)
  ret i64 0
}


; String constants
@.str.exp_ns_regularity.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_regularity.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_regularity.2 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.3 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.4 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.5 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.6 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.7 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_ns_regularity.8 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_regularity.10 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_regularity.11 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.12 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_regularity.13 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_regularity.14 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.15 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.16 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_regularity.17 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.18 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_ns_regularity.19 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_regularity.20 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.21 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_regularity.22 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_regularity.23 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_ns_regularity.24 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.25 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_regularity.26 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_regularity.27 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.28 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_regularity.29 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_regularity.30 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.31 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.32 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_regularity.33 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.34 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_ns_regularity.35 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_regularity.36 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.37 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_regularity.38 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_regularity.39 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_ns_regularity.40 = private unnamed_addr constant [45 x i8] c"#  THE REGULARITY QUESTION                 #\00"
@.str.exp_ns_regularity.41 = private unnamed_addr constant [45 x i8] c"#  Does |dT/dA| -> infinity as A -> 0?     #\00"
@.str.exp_ns_regularity.42 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_ns_regularity.43 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.44 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_regularity.45 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_regularity.46 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_regularity.47 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_regularity.48 = private unnamed_addr constant [44 x i8] c"=== Test 1: Standard Burgers (ν=0.005) ===\00"
@.str.exp_ns_regularity.49 = private unnamed_addr constant [53 x i8] c"  Known result: Cole-Hopf guarantees no true blow-up\00"
@.str.exp_ns_regularity.50 = private unnamed_addr constant [40 x i8] c"  |∂T/∂A| should → ∞ as A → 0\00"
@.str.exp_ns_regularity.51 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.52 = private unnamed_addr constant [73 x i8] c"  Amplitude    T_blowup     |∂T/∂A|      |∂T/∂A|/A    Diverging?\00"
@.str.exp_ns_regularity.53 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_regularity.54 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_regularity.55 = private unnamed_addr constant [5 x i8] c"2.01\00"
@.str.exp_ns_regularity.56 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.57 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.58 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.59 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.60 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.61 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_ns_regularity.62 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.63 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.64 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_regularity.65 = private unnamed_addr constant [10 x i8] c"  YES ↑\00"
@.str.exp_ns_regularity.66 = private unnamed_addr constant [9 x i8] c"100000.0\00"
@.str.exp_ns_regularity.67 = private unnamed_addr constant [12 x i8] c"  DIVERGING\00"
@.str.exp_ns_regularity.68 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.69 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.70 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.71 = private unnamed_addr constant [49 x i8] c"=== Test 2: Low Viscosity Burgers (ν=0.001) ===\00"
@.str.exp_ns_regularity.72 = private unnamed_addr constant [57 x i8] c"  Closer to inviscid — does |∂T/∂A| still diverge?\00"
@.str.exp_ns_regularity.73 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.74 = private unnamed_addr constant [56 x i8] c"  Amplitude    T_blowup     |∂T/∂A|      Diverging?\00"
@.str.exp_ns_regularity.75 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_regularity.76 = private unnamed_addr constant [5 x i8] c"2.01\00"
@.str.exp_ns_regularity.77 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_regularity.78 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_regularity.79 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_regularity.80 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.81 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.82 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_ns_regularity.83 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.84 = private unnamed_addr constant [13 x i8] c"  NO BLOW-UP\00"
@.str.exp_ns_regularity.85 = private unnamed_addr constant [8 x i8] c"50000.0\00"
@.str.exp_ns_regularity.86 = private unnamed_addr constant [12 x i8] c"  DIVERGING\00"
@.str.exp_ns_regularity.87 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.88 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.89 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.90 = private unnamed_addr constant [62 x i8] c"=== Test 3: Amplified Burgers (γ=0.1, vortex stretching) ===\00"
@.str.exp_ns_regularity.91 = private unnamed_addr constant [67 x i8] c"  Added term: γ·u·|du/dx| amplifies velocity at steep gradients\00"
@.str.exp_ns_regularity.92 = private unnamed_addr constant [65 x i8] c"  This is closer to 3D NS where vortex stretching drives blow-up\00"
@.str.exp_ns_regularity.93 = private unnamed_addr constant [65 x i8] c"  QUESTION: Does |∂T/∂A| still diverge? Or does it SATURATE?\00"
@.str.exp_ns_regularity.94 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.95 = private unnamed_addr constant [56 x i8] c"  Amplitude    T_blowup     |∂T/∂A|      Diverging?\00"
@.str.exp_ns_regularity.96 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_regularity.97 = private unnamed_addr constant [5 x i8] c"2.01\00"
@.str.exp_ns_regularity.98 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.99 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.100 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.101 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.102 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.103 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.104 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.105 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.106 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_ns_regularity.107 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.108 = private unnamed_addr constant [13 x i8] c"  NO BLOW-UP\00"
@.str.exp_ns_regularity.109 = private unnamed_addr constant [8 x i8] c"50000.0\00"
@.str.exp_ns_regularity.110 = private unnamed_addr constant [12 x i8] c"  DIVERGING\00"
@.str.exp_ns_regularity.111 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.112 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.113 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.114 = private unnamed_addr constant [46 x i8] c"=== Test 4: Strong Amplification (γ=0.5) ===\00"
@.str.exp_ns_regularity.115 = private unnamed_addr constant [54 x i8] c"  Does strong vortex stretching BREAK the divergence?\00"
@.str.exp_ns_regularity.116 = private unnamed_addr constant [49 x i8] c"  If |∂T/∂A| saturates: regularity may FAIL.\00"
@.str.exp_ns_regularity.117 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.118 = private unnamed_addr constant [56 x i8] c"  Amplitude    T_blowup     |∂T/∂A|      Diverging?\00"
@.str.exp_ns_regularity.119 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_regularity.120 = private unnamed_addr constant [5 x i8] c"2.01\00"
@.str.exp_ns_regularity.121 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.122 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_regularity.123 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.124 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_regularity.125 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.126 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_regularity.127 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.128 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.129 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_ns_regularity.130 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.131 = private unnamed_addr constant [13 x i8] c"  NO BLOW-UP\00"
@.str.exp_ns_regularity.132 = private unnamed_addr constant [8 x i8] c"50000.0\00"
@.str.exp_ns_regularity.133 = private unnamed_addr constant [12 x i8] c"  DIVERGING\00"
@.str.exp_ns_regularity.134 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.135 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.136 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.137 = private unnamed_addr constant [31 x i8] c"=== Test 5: THE RATIO TEST ===\00"
@.str.exp_ns_regularity.138 = private unnamed_addr constant [51 x i8] c"  For each system, compute R(A) = |∂T/∂A| × A\00"
@.str.exp_ns_regularity.139 = private unnamed_addr constant [84 x i8] c"  If R → ∞ as A → 0: |∂T/∂A| diverges FASTER than 1/A (strong regularity)\00"
@.str.exp_ns_regularity.140 = private unnamed_addr constant [58 x i8] c"  If R → const: |∂T/∂A| ~ 1/A (marginal regularity)\00"
@.str.exp_ns_regularity.141 = private unnamed_addr constant [70 x i8] c"  If R → 0: |∂T/∂A| grows SLOWER than 1/A (regularity may fail)\00"
@.str.exp_ns_regularity.142 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.143 = private unnamed_addr constant [76 x i8] c"  System              A=0.05      A=0.1       A=0.2       A=0.4       Trend\00"
@.str.exp_ns_regularity.144 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_regularity.145 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_regularity.146 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_regularity.147 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_regularity.148 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_regularity.149 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_regularity.150 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_regularity.151 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.152 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_regularity.153 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.154 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.155 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_regularity.156 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.157 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.158 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.159 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.160 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.161 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.162 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_regularity.163 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.164 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_regularity.165 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.166 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.167 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_regularity.168 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_regularity.169 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.170 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_regularity.171 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.172 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.173 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_regularity.174 = private unnamed_addr constant [24 x i8] c"  Burgers ν=0.005     \00"
@.str.exp_ns_regularity.175 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.176 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.177 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.178 = private unnamed_addr constant [24 x i8] c"  R DECREASING (strong)\00"
@.str.exp_ns_regularity.179 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.180 = private unnamed_addr constant [29 x i8] c"  R INCREASING (very strong)\00"
@.str.exp_ns_regularity.181 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_regularity.182 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.183 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.184 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_regularity.185 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.186 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.187 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.188 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_regularity.189 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.190 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.191 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.192 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.193 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.194 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.195 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.196 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.197 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_regularity.198 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.199 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.200 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_regularity.201 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.202 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.203 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.204 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_regularity.205 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_regularity.206 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.207 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.208 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_regularity.209 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.210 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.211 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.212 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_regularity.213 = private unnamed_addr constant [24 x i8] c"  Amplified γ=0.1     \00"
@.str.exp_ns_regularity.214 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.215 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.216 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.217 = private unnamed_addr constant [15 x i8] c"  R DECREASING\00"
@.str.exp_ns_regularity.218 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.219 = private unnamed_addr constant [15 x i8] c"  R INCREASING\00"
@.str.exp_ns_regularity.220 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_regularity.221 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.222 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_regularity.223 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_regularity.224 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.225 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_regularity.226 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.227 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_regularity.228 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.229 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.230 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_regularity.231 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.232 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.233 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_regularity.234 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.235 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_regularity.236 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_regularity.237 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.238 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_regularity.239 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_regularity.240 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.241 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_regularity.242 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.243 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_regularity.244 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_regularity.245 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.246 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_regularity.247 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_regularity.248 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_regularity.249 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_regularity.250 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_regularity.251 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_regularity.252 = private unnamed_addr constant [24 x i8] c"  Amplified γ=0.5     \00"
@.str.exp_ns_regularity.253 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.254 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.255 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_regularity.256 = private unnamed_addr constant [15 x i8] c"  R DECREASING\00"
@.str.exp_ns_regularity.257 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.258 = private unnamed_addr constant [15 x i8] c"  R INCREASING\00"
@.str.exp_ns_regularity.259 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_regularity.260 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_ns_regularity.261 = private unnamed_addr constant [45 x i8] c"#  INTERPRETATION:                         #\00"
@.str.exp_ns_regularity.262 = private unnamed_addr constant [45 x i8] c"#                                          #\00"
@.str.exp_ns_regularity.263 = private unnamed_addr constant [45 x i8] c"#  If |dT/dA| -> inf as A -> 0:            #\00"
@.str.exp_ns_regularity.264 = private unnamed_addr constant [47 x i8] c"#  REGULARITY HOLDS — smooth data = no     #\00"
@.str.exp_ns_regularity.265 = private unnamed_addr constant [46 x i8] c"#  blow-up. The meta-gradient diverges at   #\00"
@.str.exp_ns_regularity.266 = private unnamed_addr constant [45 x i8] c"#  the regularity boundary.                #\00"
@.str.exp_ns_regularity.267 = private unnamed_addr constant [45 x i8] c"#                                          #\00"
@.str.exp_ns_regularity.268 = private unnamed_addr constant [46 x i8] c"#  If |dT/dA| saturates as A -> 0:          #\00"
@.str.exp_ns_regularity.269 = private unnamed_addr constant [47 x i8] c"#  REGULARITY MAY FAIL — there exists a    #\00"
@.str.exp_ns_regularity.270 = private unnamed_addr constant [46 x i8] c"#  minimum blow-up time independent of      #\00"
@.str.exp_ns_regularity.271 = private unnamed_addr constant [45 x i8] c"#  smoothness. Finite-time singularity.    #\00"
@.str.exp_ns_regularity.272 = private unnamed_addr constant [45 x i8] c"#                                          #\00"
@.str.exp_ns_regularity.273 = private unnamed_addr constant [45 x i8] c"#  The vortex stretching term (gamma > 0)  #\00"
@.str.exp_ns_regularity.274 = private unnamed_addr constant [45 x i8] c"#  tests whether 3D-like nonlinearity      #\00"
@.str.exp_ns_regularity.275 = private unnamed_addr constant [45 x i8] c"#  breaks the regularity signature.        #\00"
@.str.exp_ns_regularity.276 = private unnamed_addr constant [45 x i8] c"#  If it does: the 3D NS problem is        #\00"
@.str.exp_ns_regularity.277 = private unnamed_addr constant [46 x i8] c"#  fundamentally different from 1D Burgers. #\00"
@.str.exp_ns_regularity.278 = private unnamed_addr constant [45 x i8] c"#  If it doesn't: regularity persists      #\00"
@.str.exp_ns_regularity.279 = private unnamed_addr constant [45 x i8] c"#  even with stretching.                   #\00"
@.str.exp_ns_regularity.280 = private unnamed_addr constant [45 x i8] c"############################################\00"
