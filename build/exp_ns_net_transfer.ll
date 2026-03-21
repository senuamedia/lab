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
  %t1 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"my_sqrt"(i64 %x) nounwind {
entry:
  %local.g.9 = alloca i64
  %local.i.10 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t11 = load i64, ptr %local.x
  %t12 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.2)
  %t13 = call i64 @"sx_f64_le"(i64 %t11, i64 %t12)
  %t14 = icmp ne i64 %t13, 0
  br i1 %t14, label %then1, label %else1
then1:
  %t15 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.3)
  ret i64 %t15
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t16 = phi i64 [ 0, %else1_end ]
  %t17 = load i64, ptr %local.x
  store i64 %t17, ptr %local.g.9
  store i64 0, ptr %local.i.10
  br label %loop2
loop2:
  %t18 = load i64, ptr %local.i.10
  %t19 = icmp slt i64 %t18, 30
  %t20 = zext i1 %t19 to i64
  %t21 = icmp ne i64 %t20, 0
  br i1 %t21, label %body2, label %endloop2
body2:
  %t22 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.4)
  %t23 = load i64, ptr %local.g.9
  %t24 = load i64, ptr %local.x
  %t25 = load i64, ptr %local.g.9
  %t26 = call i64 @"sx_f64_div"(i64 %t24, i64 %t25)
  %t27 = call i64 @"sx_f64_add"(i64 %t23, i64 %t26)
  %t28 = call i64 @"sx_f64_mul"(i64 %t22, i64 %t27)
  store i64 %t28, ptr %local.g.9
  %t29 = load i64, ptr %local.i.10
  %t30 = add i64 %t29, 1
  store i64 %t30, ptr %local.i.10
  br label %loop2
endloop2:
  %t31 = load i64, ptr %local.g.9
  ret i64 %t31
}

define i64 @"ksq"(i64 %kx, i64 %ky, i64 %kz) nounwind {
entry:
  %local.fx.32 = alloca i64
  %local.fy.33 = alloca i64
  %local.fz.34 = alloca i64
  %local.kx = alloca i64
  store i64 %kx, ptr %local.kx
  %local.ky = alloca i64
  store i64 %ky, ptr %local.ky
  %local.kz = alloca i64
  store i64 %kz, ptr %local.kz
  %t35 = load i64, ptr %local.kx
  %t36 = call i64 @"sx_int_to_f64"(i64 %t35)
  store i64 %t36, ptr %local.fx.32
  %t37 = load i64, ptr %local.ky
  %t38 = call i64 @"sx_int_to_f64"(i64 %t37)
  store i64 %t38, ptr %local.fy.33
  %t39 = load i64, ptr %local.kz
  %t40 = call i64 @"sx_int_to_f64"(i64 %t39)
  store i64 %t40, ptr %local.fz.34
  %t41 = load i64, ptr %local.fx.32
  %t42 = load i64, ptr %local.fx.32
  %t43 = call i64 @"sx_f64_mul"(i64 %t41, i64 %t42)
  %t44 = load i64, ptr %local.fy.33
  %t45 = load i64, ptr %local.fy.33
  %t46 = call i64 @"sx_f64_mul"(i64 %t44, i64 %t45)
  %t47 = call i64 @"sx_f64_add"(i64 %t43, i64 %t46)
  %t48 = load i64, ptr %local.fz.34
  %t49 = load i64, ptr %local.fz.34
  %t50 = call i64 @"sx_f64_mul"(i64 %t48, i64 %t49)
  %t51 = call i64 @"sx_f64_add"(i64 %t47, i64 %t50)
  ret i64 %t51
}

define i64 @"dot3"(i64 %ax, i64 %ay, i64 %az, i64 %bx, i64 %by, i64 %bz) nounwind {
entry:
  %local.ax = alloca i64
  store i64 %ax, ptr %local.ax
  %local.ay = alloca i64
  store i64 %ay, ptr %local.ay
  %local.az = alloca i64
  store i64 %az, ptr %local.az
  %local.bx = alloca i64
  store i64 %bx, ptr %local.bx
  %local.by = alloca i64
  store i64 %by, ptr %local.by
  %local.bz = alloca i64
  store i64 %bz, ptr %local.bz
  %t52 = load i64, ptr %local.ax
  %t53 = load i64, ptr %local.bx
  %t54 = mul i64 %t52, %t53
  %t55 = load i64, ptr %local.ay
  %t56 = load i64, ptr %local.by
  %t57 = mul i64 %t55, %t56
  %t58 = add i64 %t54, %t57
  %t59 = load i64, ptr %local.az
  %t60 = load i64, ptr %local.bz
  %t61 = mul i64 %t59, %t60
  %t62 = add i64 %t58, %t61
  %t63 = call i64 @"sx_int_to_f64"(i64 %t62)
  ret i64 %t63
}

define i64 @"incoming"(i64 %kx, i64 %ky, i64 %kz, i64 %n_max, i64 %s) nounwind {
entry:
  %local.total.64 = alloca i64
  %local.nf.65 = alloca i64
  %local.px.66 = alloca i64
  %local.py.67 = alloca i64
  %local.pz.68 = alloca i64
  %local.p2.69 = alloca i64
  %local.qx.70 = alloca i64
  %local.qy.71 = alloca i64
  %local.qz.72 = alloca i64
  %local.q2.73 = alloca i64
  %local.u_p_sq.74 = alloca i64
  %local.p_mag.75 = alloca i64
  %local.denom.76 = alloca i64
  %local.si.77 = alloca i64
  %local.qk.78 = alloca i64
  %local.k2.79 = alloca i64
  %local.sin2.80 = alloca i64
  %local.cos2.81 = alloca i64
  %local.kx = alloca i64
  store i64 %kx, ptr %local.kx
  %local.ky = alloca i64
  store i64 %ky, ptr %local.ky
  %local.kz = alloca i64
  store i64 %kz, ptr %local.kz
  %local.n_max = alloca i64
  store i64 %n_max, ptr %local.n_max
  %local.s = alloca i64
  store i64 %s, ptr %local.s
  %t82 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.5)
  store i64 %t82, ptr %local.total.64
  %t83 = load i64, ptr %local.n_max
  %t84 = call i64 @"sx_int_to_f64"(i64 %t83)
  store i64 %t84, ptr %local.nf.65
  %t85 = load i64, ptr %local.n_max
  %t86 = sub i64 0, %t85
  store i64 %t86, ptr %local.px.66
  br label %loop3
loop3:
  %t87 = load i64, ptr %local.px.66
  %t88 = load i64, ptr %local.n_max
  %t89 = icmp sle i64 %t87, %t88
  %t90 = zext i1 %t89 to i64
  %t91 = icmp ne i64 %t90, 0
  br i1 %t91, label %body3, label %endloop3
body3:
  %t92 = load i64, ptr %local.n_max
  %t93 = sub i64 0, %t92
  store i64 %t93, ptr %local.py.67
  br label %loop4
loop4:
  %t94 = load i64, ptr %local.py.67
  %t95 = load i64, ptr %local.n_max
  %t96 = icmp sle i64 %t94, %t95
  %t97 = zext i1 %t96 to i64
  %t98 = icmp ne i64 %t97, 0
  br i1 %t98, label %body4, label %endloop4
body4:
  %t99 = load i64, ptr %local.n_max
  %t100 = sub i64 0, %t99
  store i64 %t100, ptr %local.pz.68
  br label %loop5
loop5:
  %t101 = load i64, ptr %local.pz.68
  %t102 = load i64, ptr %local.n_max
  %t103 = icmp sle i64 %t101, %t102
  %t104 = zext i1 %t103 to i64
  %t105 = icmp ne i64 %t104, 0
  br i1 %t105, label %body5, label %endloop5
body5:
  %t106 = load i64, ptr %local.px.66
  %t107 = load i64, ptr %local.py.67
  %t108 = load i64, ptr %local.pz.68
  %t109 = call i64 @"ksq"(i64 %t106, i64 %t107, i64 %t108)
  store i64 %t109, ptr %local.p2.69
  %t110 = load i64, ptr %local.p2.69
  %t111 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.6)
  %t112 = call i64 @"sx_f64_gt"(i64 %t110, i64 %t111)
  %t113 = icmp ne i64 %t112, 0
  br i1 %t113, label %then6, label %else6
then6:
  %t114 = load i64, ptr %local.kx
  %t115 = load i64, ptr %local.px.66
  %t116 = sub i64 %t114, %t115
  store i64 %t116, ptr %local.qx.70
  %t117 = load i64, ptr %local.ky
  %t118 = load i64, ptr %local.py.67
  %t119 = sub i64 %t117, %t118
  store i64 %t119, ptr %local.qy.71
  %t120 = load i64, ptr %local.kz
  %t121 = load i64, ptr %local.pz.68
  %t122 = sub i64 %t120, %t121
  store i64 %t122, ptr %local.qz.72
  %t123 = load i64, ptr %local.qx.70
  %t124 = load i64, ptr %local.qy.71
  %t125 = load i64, ptr %local.qz.72
  %t126 = call i64 @"ksq"(i64 %t123, i64 %t124, i64 %t125)
  store i64 %t126, ptr %local.q2.73
  %t127 = load i64, ptr %local.q2.73
  %t128 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.7)
  %t129 = call i64 @"sx_f64_gt"(i64 %t127, i64 %t128)
  %t130 = icmp ne i64 %t129, 0
  br i1 %t130, label %then7, label %else7
then7:
  %t131 = load i64, ptr %local.q2.73
  %t132 = load i64, ptr %local.nf.65
  %t133 = load i64, ptr %local.nf.65
  %t134 = call i64 @"sx_f64_mul"(i64 %t132, i64 %t133)
  %t135 = call i64 @"sx_f64_le"(i64 %t131, i64 %t134)
  %t136 = icmp ne i64 %t135, 0
  br i1 %t136, label %then8, label %else8
then8:
  %t137 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.8)
  store i64 %t137, ptr %local.u_p_sq.74
  %t138 = load i64, ptr %local.s
  %t139 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.9)
  %t140 = call i64 @"sx_f64_gt"(i64 %t138, i64 %t139)
  %t141 = icmp ne i64 %t140, 0
  br i1 %t141, label %then9, label %else9
then9:
  %t142 = load i64, ptr %local.p2.69
  %t143 = call i64 @"my_sqrt"(i64 %t142)
  store i64 %t143, ptr %local.p_mag.75
  %t144 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.10)
  store i64 %t144, ptr %local.denom.76
  store i64 0, ptr %local.si.77
  br label %loop10
loop10:
  %t145 = load i64, ptr %local.si.77
  %t146 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.11)
  %t147 = load i64, ptr %local.s
  %t148 = call i64 @"sx_f64_mul"(i64 %t146, i64 %t147)
  %t149 = call i64 @"sx_f64_to_int"(i64 %t148)
  %t150 = call i64 @"sx_f64_lt"(i64 %t145, i64 %t149)
  %t151 = icmp ne i64 %t150, 0
  br i1 %t151, label %body10, label %endloop10
body10:
  %t152 = load i64, ptr %local.denom.76
  %t153 = load i64, ptr %local.p_mag.75
  %t154 = call i64 @"sx_f64_mul"(i64 %t152, i64 %t153)
  store i64 %t154, ptr %local.denom.76
  %t155 = load i64, ptr %local.si.77
  %t156 = add i64 %t155, 1
  store i64 %t156, ptr %local.si.77
  br label %loop10
endloop10:
  %t157 = load i64, ptr %local.denom.76
  %t158 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.12)
  %t159 = call i64 @"sx_f64_gt"(i64 %t157, i64 %t158)
  %t160 = icmp ne i64 %t159, 0
  br i1 %t160, label %then11, label %else11
then11:
  %t161 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.13)
  %t162 = load i64, ptr %local.denom.76
  %t163 = call i64 @"sx_f64_div"(i64 %t161, i64 %t162)
  store i64 %t163, ptr %local.u_p_sq.74
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t164 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t165 = phi i64 [ %t164, %then9_end ], [ 0, %else9_end ]
  %t166 = load i64, ptr %local.qx.70
  %t167 = load i64, ptr %local.qy.71
  %t168 = load i64, ptr %local.qz.72
  %t169 = load i64, ptr %local.kx
  %t170 = load i64, ptr %local.ky
  %t171 = load i64, ptr %local.kz
  %t172 = call i64 @"dot3"(i64 %t166, i64 %t167, i64 %t168, i64 %t169, i64 %t170, i64 %t171)
  store i64 %t172, ptr %local.qk.78
  %t173 = load i64, ptr %local.kx
  %t174 = load i64, ptr %local.ky
  %t175 = load i64, ptr %local.kz
  %t176 = call i64 @"ksq"(i64 %t173, i64 %t174, i64 %t175)
  store i64 %t176, ptr %local.k2.79
  %t177 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.14)
  store i64 %t177, ptr %local.sin2.80
  %t178 = load i64, ptr %local.q2.73
  %t179 = load i64, ptr %local.k2.79
  %t180 = call i64 @"sx_f64_mul"(i64 %t178, i64 %t179)
  %t181 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.15)
  %t182 = call i64 @"sx_f64_gt"(i64 %t180, i64 %t181)
  %t183 = icmp ne i64 %t182, 0
  br i1 %t183, label %then12, label %else12
then12:
  %t184 = load i64, ptr %local.qk.78
  %t185 = load i64, ptr %local.qk.78
  %t186 = call i64 @"sx_f64_mul"(i64 %t184, i64 %t185)
  %t187 = load i64, ptr %local.q2.73
  %t188 = load i64, ptr %local.k2.79
  %t189 = call i64 @"sx_f64_mul"(i64 %t187, i64 %t188)
  %t190 = call i64 @"sx_f64_div"(i64 %t186, i64 %t189)
  store i64 %t190, ptr %local.cos2.81
  %t191 = load i64, ptr %local.cos2.81
  %t192 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.16)
  %t193 = call i64 @"sx_f64_lt"(i64 %t191, i64 %t192)
  %t194 = icmp ne i64 %t193, 0
  br i1 %t194, label %then13, label %else13
then13:
  %t195 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.17)
  %t196 = load i64, ptr %local.cos2.81
  %t197 = call i64 @"sx_f64_sub"(i64 %t195, i64 %t196)
  store i64 %t197, ptr %local.sin2.80
  br label %then13_end
then13_end:
  br label %endif13
else13:
  %t198 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.18)
  store i64 %t198, ptr %local.sin2.80
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t199 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t200 = phi i64 [ %t199, %then12_end ], [ 0, %else12_end ]
  %t201 = load i64, ptr %local.total.64
  %t202 = load i64, ptr %local.q2.73
  %t203 = load i64, ptr %local.u_p_sq.74
  %t204 = call i64 @"sx_f64_mul"(i64 %t202, i64 %t203)
  %t205 = load i64, ptr %local.sin2.80
  %t206 = call i64 @"sx_f64_mul"(i64 %t204, i64 %t205)
  %t207 = call i64 @"sx_f64_add"(i64 %t201, i64 %t206)
  store i64 %t207, ptr %local.total.64
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t208 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t209 = phi i64 [ %t208, %then7_end ], [ 0, %else7_end ]
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t210 = phi i64 [ %t209, %then6_end ], [ 0, %else6_end ]
  %t211 = load i64, ptr %local.pz.68
  %t212 = add i64 %t211, 1
  store i64 %t212, ptr %local.pz.68
  br label %loop5
endloop5:
  %t213 = load i64, ptr %local.py.67
  %t214 = add i64 %t213, 1
  store i64 %t214, ptr %local.py.67
  br label %loop4
endloop4:
  %t215 = load i64, ptr %local.px.66
  %t216 = add i64 %t215, 1
  store i64 %t216, ptr %local.px.66
  br label %loop3
endloop3:
  %t217 = load i64, ptr %local.total.64
  ret i64 %t217
}

define i64 @"outgoing"(i64 %kx, i64 %ky, i64 %kz, i64 %n_max, i64 %s) nounwind {
entry:
  %local.total.218 = alloca i64
  %local.nf.219 = alloca i64
  %local.k2.220 = alloca i64
  %local.u_k_sq.221 = alloca i64
  %local.k_mag.222 = alloca i64
  %local.denom.223 = alloca i64
  %local.si.224 = alloca i64
  %local.qx.225 = alloca i64
  %local.qy.226 = alloca i64
  %local.qz.227 = alloca i64
  %local.q2.228 = alloca i64
  %local.px.229 = alloca i64
  %local.py.230 = alloca i64
  %local.pz.231 = alloca i64
  %local.p2.232 = alloca i64
  %local.qp.233 = alloca i64
  %local.sin2.234 = alloca i64
  %local.cos2.235 = alloca i64
  %local.kx = alloca i64
  store i64 %kx, ptr %local.kx
  %local.ky = alloca i64
  store i64 %ky, ptr %local.ky
  %local.kz = alloca i64
  store i64 %kz, ptr %local.kz
  %local.n_max = alloca i64
  store i64 %n_max, ptr %local.n_max
  %local.s = alloca i64
  store i64 %s, ptr %local.s
  %t236 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.19)
  store i64 %t236, ptr %local.total.218
  %t237 = load i64, ptr %local.n_max
  %t238 = call i64 @"sx_int_to_f64"(i64 %t237)
  store i64 %t238, ptr %local.nf.219
  %t239 = load i64, ptr %local.kx
  %t240 = load i64, ptr %local.ky
  %t241 = load i64, ptr %local.kz
  %t242 = call i64 @"ksq"(i64 %t239, i64 %t240, i64 %t241)
  store i64 %t242, ptr %local.k2.220
  %t243 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.20)
  store i64 %t243, ptr %local.u_k_sq.221
  %t244 = load i64, ptr %local.s
  %t245 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.21)
  %t246 = call i64 @"sx_f64_gt"(i64 %t244, i64 %t245)
  %t247 = icmp ne i64 %t246, 0
  br i1 %t247, label %then14, label %else14
then14:
  %t248 = load i64, ptr %local.k2.220
  %t249 = call i64 @"my_sqrt"(i64 %t248)
  store i64 %t249, ptr %local.k_mag.222
  %t250 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.22)
  store i64 %t250, ptr %local.denom.223
  store i64 0, ptr %local.si.224
  br label %loop15
loop15:
  %t251 = load i64, ptr %local.si.224
  %t252 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.23)
  %t253 = load i64, ptr %local.s
  %t254 = call i64 @"sx_f64_mul"(i64 %t252, i64 %t253)
  %t255 = call i64 @"sx_f64_to_int"(i64 %t254)
  %t256 = call i64 @"sx_f64_lt"(i64 %t251, i64 %t255)
  %t257 = icmp ne i64 %t256, 0
  br i1 %t257, label %body15, label %endloop15
body15:
  %t258 = load i64, ptr %local.denom.223
  %t259 = load i64, ptr %local.k_mag.222
  %t260 = call i64 @"sx_f64_mul"(i64 %t258, i64 %t259)
  store i64 %t260, ptr %local.denom.223
  %t261 = load i64, ptr %local.si.224
  %t262 = add i64 %t261, 1
  store i64 %t262, ptr %local.si.224
  br label %loop15
endloop15:
  %t263 = load i64, ptr %local.denom.223
  %t264 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.24)
  %t265 = call i64 @"sx_f64_gt"(i64 %t263, i64 %t264)
  %t266 = icmp ne i64 %t265, 0
  br i1 %t266, label %then16, label %else16
then16:
  %t267 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.25)
  %t268 = load i64, ptr %local.denom.223
  %t269 = call i64 @"sx_f64_div"(i64 %t267, i64 %t268)
  store i64 %t269, ptr %local.u_k_sq.221
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t270 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t271 = phi i64 [ %t270, %then14_end ], [ 0, %else14_end ]
  %t272 = load i64, ptr %local.n_max
  %t273 = sub i64 0, %t272
  store i64 %t273, ptr %local.qx.225
  br label %loop17
loop17:
  %t274 = load i64, ptr %local.qx.225
  %t275 = load i64, ptr %local.n_max
  %t276 = icmp sle i64 %t274, %t275
  %t277 = zext i1 %t276 to i64
  %t278 = icmp ne i64 %t277, 0
  br i1 %t278, label %body17, label %endloop17
body17:
  %t279 = load i64, ptr %local.n_max
  %t280 = sub i64 0, %t279
  store i64 %t280, ptr %local.qy.226
  br label %loop18
loop18:
  %t281 = load i64, ptr %local.qy.226
  %t282 = load i64, ptr %local.n_max
  %t283 = icmp sle i64 %t281, %t282
  %t284 = zext i1 %t283 to i64
  %t285 = icmp ne i64 %t284, 0
  br i1 %t285, label %body18, label %endloop18
body18:
  %t286 = load i64, ptr %local.n_max
  %t287 = sub i64 0, %t286
  store i64 %t287, ptr %local.qz.227
  br label %loop19
loop19:
  %t288 = load i64, ptr %local.qz.227
  %t289 = load i64, ptr %local.n_max
  %t290 = icmp sle i64 %t288, %t289
  %t291 = zext i1 %t290 to i64
  %t292 = icmp ne i64 %t291, 0
  br i1 %t292, label %body19, label %endloop19
body19:
  %t293 = load i64, ptr %local.qx.225
  %t294 = load i64, ptr %local.qy.226
  %t295 = load i64, ptr %local.qz.227
  %t296 = call i64 @"ksq"(i64 %t293, i64 %t294, i64 %t295)
  store i64 %t296, ptr %local.q2.228
  %t297 = load i64, ptr %local.q2.228
  %t298 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.26)
  %t299 = call i64 @"sx_f64_gt"(i64 %t297, i64 %t298)
  %t300 = icmp ne i64 %t299, 0
  br i1 %t300, label %then20, label %else20
then20:
  %t301 = load i64, ptr %local.kx
  %t302 = load i64, ptr %local.qx.225
  %t303 = add i64 %t301, %t302
  store i64 %t303, ptr %local.px.229
  %t304 = load i64, ptr %local.ky
  %t305 = load i64, ptr %local.qy.226
  %t306 = add i64 %t304, %t305
  store i64 %t306, ptr %local.py.230
  %t307 = load i64, ptr %local.kz
  %t308 = load i64, ptr %local.qz.227
  %t309 = add i64 %t307, %t308
  store i64 %t309, ptr %local.pz.231
  %t310 = load i64, ptr %local.px.229
  %t311 = load i64, ptr %local.py.230
  %t312 = load i64, ptr %local.pz.231
  %t313 = call i64 @"ksq"(i64 %t310, i64 %t311, i64 %t312)
  store i64 %t313, ptr %local.p2.232
  %t314 = load i64, ptr %local.p2.232
  %t315 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.27)
  %t316 = call i64 @"sx_f64_gt"(i64 %t314, i64 %t315)
  %t317 = icmp ne i64 %t316, 0
  br i1 %t317, label %then21, label %else21
then21:
  %t318 = load i64, ptr %local.p2.232
  %t319 = load i64, ptr %local.nf.219
  %t320 = load i64, ptr %local.nf.219
  %t321 = call i64 @"sx_f64_mul"(i64 %t319, i64 %t320)
  %t322 = call i64 @"sx_f64_le"(i64 %t318, i64 %t321)
  %t323 = icmp ne i64 %t322, 0
  br i1 %t323, label %then22, label %else22
then22:
  %t324 = load i64, ptr %local.qx.225
  %t325 = load i64, ptr %local.qy.226
  %t326 = load i64, ptr %local.qz.227
  %t327 = load i64, ptr %local.px.229
  %t328 = load i64, ptr %local.py.230
  %t329 = load i64, ptr %local.pz.231
  %t330 = call i64 @"dot3"(i64 %t324, i64 %t325, i64 %t326, i64 %t327, i64 %t328, i64 %t329)
  store i64 %t330, ptr %local.qp.233
  %t331 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.28)
  store i64 %t331, ptr %local.sin2.234
  %t332 = load i64, ptr %local.q2.228
  %t333 = load i64, ptr %local.p2.232
  %t334 = call i64 @"sx_f64_mul"(i64 %t332, i64 %t333)
  %t335 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.29)
  %t336 = call i64 @"sx_f64_gt"(i64 %t334, i64 %t335)
  %t337 = icmp ne i64 %t336, 0
  br i1 %t337, label %then23, label %else23
then23:
  %t338 = load i64, ptr %local.qp.233
  %t339 = load i64, ptr %local.qp.233
  %t340 = call i64 @"sx_f64_mul"(i64 %t338, i64 %t339)
  %t341 = load i64, ptr %local.q2.228
  %t342 = load i64, ptr %local.p2.232
  %t343 = call i64 @"sx_f64_mul"(i64 %t341, i64 %t342)
  %t344 = call i64 @"sx_f64_div"(i64 %t340, i64 %t343)
  store i64 %t344, ptr %local.cos2.235
  %t345 = load i64, ptr %local.cos2.235
  %t346 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.30)
  %t347 = call i64 @"sx_f64_lt"(i64 %t345, i64 %t346)
  %t348 = icmp ne i64 %t347, 0
  br i1 %t348, label %then24, label %else24
then24:
  %t349 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.31)
  %t350 = load i64, ptr %local.cos2.235
  %t351 = call i64 @"sx_f64_sub"(i64 %t349, i64 %t350)
  store i64 %t351, ptr %local.sin2.234
  br label %then24_end
then24_end:
  br label %endif24
else24:
  %t352 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.32)
  store i64 %t352, ptr %local.sin2.234
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t353 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t354 = phi i64 [ %t353, %then23_end ], [ 0, %else23_end ]
  %t355 = load i64, ptr %local.total.218
  %t356 = load i64, ptr %local.q2.228
  %t357 = load i64, ptr %local.u_k_sq.221
  %t358 = call i64 @"sx_f64_mul"(i64 %t356, i64 %t357)
  %t359 = load i64, ptr %local.sin2.234
  %t360 = call i64 @"sx_f64_mul"(i64 %t358, i64 %t359)
  %t361 = call i64 @"sx_f64_add"(i64 %t355, i64 %t360)
  store i64 %t361, ptr %local.total.218
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t362 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t363 = phi i64 [ %t362, %then21_end ], [ 0, %else21_end ]
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t364 = phi i64 [ %t363, %then20_end ], [ 0, %else20_end ]
  %t365 = load i64, ptr %local.qz.227
  %t366 = add i64 %t365, 1
  store i64 %t366, ptr %local.qz.227
  br label %loop19
endloop19:
  %t367 = load i64, ptr %local.qy.226
  %t368 = add i64 %t367, 1
  store i64 %t368, ptr %local.qy.226
  br label %loop18
endloop18:
  %t369 = load i64, ptr %local.qx.225
  %t370 = add i64 %t369, 1
  store i64 %t370, ptr %local.qx.225
  br label %loop17
endloop17:
  %t371 = load i64, ptr %local.total.218
  ret i64 %t371
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.n_test.372 = alloca i64
  %local.k_val.373 = alloca i64
  %local.sum_t.374 = alloca i64
  %local.s_in.375 = alloca i64
  %local.s_out.376 = alloca i64
  %local.t_net.377 = alloca i64
  %local.s_in.378 = alloca i64
  %local.s_out.379 = alloca i64
  %local.t_net.380 = alloca i64
  %local.n_val.381 = alloca i64
  %local.s_in.382 = alloca i64
  %local.s_out.383 = alloca i64
  %local.t_net.384 = alloca i64
  %t385 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.33)
  %t386 = ptrtoint ptr %t385 to i64
  %t387 = inttoptr i64 %t386 to ptr
  call void @intrinsic_println(ptr %t387)
  %t388 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.34)
  %t389 = ptrtoint ptr %t388 to i64
  %t390 = inttoptr i64 %t389 to ptr
  call void @intrinsic_println(ptr %t390)
  %t391 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.35)
  %t392 = ptrtoint ptr %t391 to i64
  %t393 = inttoptr i64 %t392 to ptr
  call void @intrinsic_println(ptr %t393)
  %t394 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.36)
  %t395 = ptrtoint ptr %t394 to i64
  %t396 = inttoptr i64 %t395 to ptr
  call void @intrinsic_println(ptr %t396)
  %t397 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.37)
  %t398 = ptrtoint ptr %t397 to i64
  %t399 = inttoptr i64 %t398 to ptr
  call void @intrinsic_println(ptr %t399)
  %t400 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.38)
  %t401 = ptrtoint ptr %t400 to i64
  %t402 = inttoptr i64 %t401 to ptr
  call void @intrinsic_println(ptr %t402)
  %t403 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.39)
  %t404 = ptrtoint ptr %t403 to i64
  %t405 = inttoptr i64 %t404 to ptr
  call void @intrinsic_println(ptr %t405)
  %t406 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.40)
  %t407 = ptrtoint ptr %t406 to i64
  %t408 = inttoptr i64 %t407 to ptr
  call void @intrinsic_println(ptr %t408)
  %t409 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.41)
  %t410 = ptrtoint ptr %t409 to i64
  %t411 = inttoptr i64 %t410 to ptr
  call void @intrinsic_println(ptr %t411)
  %t412 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.42)
  %t413 = ptrtoint ptr %t412 to i64
  %t414 = inttoptr i64 %t413 to ptr
  call void @intrinsic_println(ptr %t414)
  %t415 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.43)
  %t416 = ptrtoint ptr %t415 to i64
  %t417 = inttoptr i64 %t416 to ptr
  call void @intrinsic_println(ptr %t417)
  %t418 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.44)
  %t419 = ptrtoint ptr %t418 to i64
  %t420 = inttoptr i64 %t419 to ptr
  call void @intrinsic_println(ptr %t420)
  %t421 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.45)
  %t422 = ptrtoint ptr %t421 to i64
  %t423 = inttoptr i64 %t422 to ptr
  call void @intrinsic_println(ptr %t423)
  %t424 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.46)
  %t425 = ptrtoint ptr %t424 to i64
  %t426 = inttoptr i64 %t425 to ptr
  call void @intrinsic_println(ptr %t426)
  %t427 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.47)
  %t428 = ptrtoint ptr %t427 to i64
  %t429 = inttoptr i64 %t428 to ptr
  call void @intrinsic_println(ptr %t429)
  store i64 6, ptr %local.n_test.372
  store i64 1, ptr %local.k_val.373
  %t430 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.48)
  store i64 %t430, ptr %local.sum_t.374
  br label %loop25
loop25:
  %t431 = load i64, ptr %local.k_val.373
  %t432 = icmp sle i64 %t431, 6
  %t433 = zext i1 %t432 to i64
  %t434 = icmp ne i64 %t433, 0
  br i1 %t434, label %body25, label %endloop25
body25:
  %t435 = load i64, ptr %local.k_val.373
  %t436 = load i64, ptr %local.n_test.372
  %t437 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.49)
  %t438 = call i64 @"incoming"(i64 %t435, i64 0, i64 0, i64 %t436, i64 %t437)
  store i64 %t438, ptr %local.s_in.375
  %t439 = load i64, ptr %local.k_val.373
  %t440 = load i64, ptr %local.n_test.372
  %t441 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.50)
  %t442 = call i64 @"outgoing"(i64 %t439, i64 0, i64 0, i64 %t440, i64 %t441)
  store i64 %t442, ptr %local.s_out.376
  %t443 = load i64, ptr %local.s_in.375
  %t444 = load i64, ptr %local.s_out.376
  %t445 = call i64 @"sx_f64_sub"(i64 %t443, i64 %t444)
  store i64 %t445, ptr %local.t_net.377
  %t446 = load i64, ptr %local.sum_t.374
  %t447 = load i64, ptr %local.t_net.377
  %t448 = call i64 @"sx_f64_add"(i64 %t446, i64 %t447)
  store i64 %t448, ptr %local.sum_t.374
  %t449 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.51)
  %t450 = ptrtoint ptr %t449 to i64
  %t451 = inttoptr i64 %t450 to ptr
  call void @intrinsic_print(ptr %t451)
  %t452 = load i64, ptr %local.k_val.373
  call void @print_i64(i64 %t452)
  %t453 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.52)
  %t454 = ptrtoint ptr %t453 to i64
  %t455 = inttoptr i64 %t454 to ptr
  call void @intrinsic_print(ptr %t455)
  %t456 = load i64, ptr %local.s_in.375
  %t457 = call i64 @"print_f64"(i64 %t456)
  %t458 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.53)
  %t459 = ptrtoint ptr %t458 to i64
  %t460 = inttoptr i64 %t459 to ptr
  call void @intrinsic_print(ptr %t460)
  %t461 = load i64, ptr %local.s_out.376
  %t462 = call i64 @"print_f64"(i64 %t461)
  %t463 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.54)
  %t464 = ptrtoint ptr %t463 to i64
  %t465 = inttoptr i64 %t464 to ptr
  call void @intrinsic_print(ptr %t465)
  %t466 = load i64, ptr %local.t_net.377
  %t467 = call i64 @"print_f64"(i64 %t466)
  %t468 = load i64, ptr %local.t_net.377
  %t469 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.55)
  %t470 = call i64 @"sx_f64_lt"(i64 %t468, i64 %t469)
  %t471 = icmp ne i64 %t470, 0
  br i1 %t471, label %then26, label %else26
then26:
  %t472 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.56)
  %t473 = ptrtoint ptr %t472 to i64
  %t474 = inttoptr i64 %t473 to ptr
  call void @intrinsic_println(ptr %t474)
  br label %then26_end
then26_end:
  br label %endif26
else26:
  %t475 = load i64, ptr %local.t_net.377
  %t476 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.57)
  %t477 = call i64 @"sx_f64_gt"(i64 %t475, i64 %t476)
  %t478 = icmp ne i64 %t477, 0
  br i1 %t478, label %then27, label %else27
then27:
  %t479 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.58)
  %t480 = ptrtoint ptr %t479 to i64
  %t481 = inttoptr i64 %t480 to ptr
  call void @intrinsic_println(ptr %t481)
  br label %then27_end
then27_end:
  br label %endif27
else27:
  %t482 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.59)
  %t483 = ptrtoint ptr %t482 to i64
  %t484 = inttoptr i64 %t483 to ptr
  call void @intrinsic_println(ptr %t484)
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t485 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t486 = phi i64 [ 0, %then26_end ], [ %t485, %else26_end ]
  %t487 = load i64, ptr %local.k_val.373
  %t488 = add i64 %t487, 1
  store i64 %t488, ptr %local.k_val.373
  br label %loop25
endloop25:
  %t489 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.60)
  %t490 = ptrtoint ptr %t489 to i64
  %t491 = inttoptr i64 %t490 to ptr
  call void @intrinsic_println(ptr %t491)
  %t492 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.61)
  %t493 = ptrtoint ptr %t492 to i64
  %t494 = inttoptr i64 %t493 to ptr
  call void @intrinsic_print(ptr %t494)
  %t495 = load i64, ptr %local.sum_t.374
  %t496 = call i64 @"print_f64"(i64 %t495)
  %t497 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.62)
  %t498 = ptrtoint ptr %t497 to i64
  %t499 = inttoptr i64 %t498 to ptr
  call void @intrinsic_println(ptr %t499)
  %t500 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.63)
  %t501 = ptrtoint ptr %t500 to i64
  %t502 = inttoptr i64 %t501 to ptr
  call void @intrinsic_println(ptr %t502)
  %t503 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.64)
  %t504 = ptrtoint ptr %t503 to i64
  %t505 = inttoptr i64 %t504 to ptr
  call void @intrinsic_println(ptr %t505)
  %t506 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.65)
  %t507 = ptrtoint ptr %t506 to i64
  %t508 = inttoptr i64 %t507 to ptr
  call void @intrinsic_println(ptr %t508)
  %t509 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.66)
  %t510 = ptrtoint ptr %t509 to i64
  %t511 = inttoptr i64 %t510 to ptr
  call void @intrinsic_println(ptr %t511)
  %t512 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.67)
  %t513 = ptrtoint ptr %t512 to i64
  %t514 = inttoptr i64 %t513 to ptr
  call void @intrinsic_println(ptr %t514)
  store i64 1, ptr %local.k_val.373
  %t515 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.68)
  store i64 %t515, ptr %local.sum_t.374
  br label %loop28
loop28:
  %t516 = load i64, ptr %local.k_val.373
  %t517 = icmp sle i64 %t516, 6
  %t518 = zext i1 %t517 to i64
  %t519 = icmp ne i64 %t518, 0
  br i1 %t519, label %body28, label %endloop28
body28:
  %t520 = load i64, ptr %local.k_val.373
  %t521 = load i64, ptr %local.n_test.372
  %t522 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.69)
  %t523 = call i64 @"incoming"(i64 %t520, i64 0, i64 0, i64 %t521, i64 %t522)
  store i64 %t523, ptr %local.s_in.378
  %t524 = load i64, ptr %local.k_val.373
  %t525 = load i64, ptr %local.n_test.372
  %t526 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.70)
  %t527 = call i64 @"outgoing"(i64 %t524, i64 0, i64 0, i64 %t525, i64 %t526)
  store i64 %t527, ptr %local.s_out.379
  %t528 = load i64, ptr %local.s_in.378
  %t529 = load i64, ptr %local.s_out.379
  %t530 = call i64 @"sx_f64_sub"(i64 %t528, i64 %t529)
  store i64 %t530, ptr %local.t_net.380
  %t531 = load i64, ptr %local.sum_t.374
  %t532 = load i64, ptr %local.t_net.380
  %t533 = call i64 @"sx_f64_add"(i64 %t531, i64 %t532)
  store i64 %t533, ptr %local.sum_t.374
  %t534 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.71)
  %t535 = ptrtoint ptr %t534 to i64
  %t536 = inttoptr i64 %t535 to ptr
  call void @intrinsic_print(ptr %t536)
  %t537 = load i64, ptr %local.k_val.373
  call void @print_i64(i64 %t537)
  %t538 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.72)
  %t539 = ptrtoint ptr %t538 to i64
  %t540 = inttoptr i64 %t539 to ptr
  call void @intrinsic_print(ptr %t540)
  %t541 = load i64, ptr %local.s_in.378
  %t542 = call i64 @"print_f64"(i64 %t541)
  %t543 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.73)
  %t544 = ptrtoint ptr %t543 to i64
  %t545 = inttoptr i64 %t544 to ptr
  call void @intrinsic_print(ptr %t545)
  %t546 = load i64, ptr %local.s_out.379
  %t547 = call i64 @"print_f64"(i64 %t546)
  %t548 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.74)
  %t549 = ptrtoint ptr %t548 to i64
  %t550 = inttoptr i64 %t549 to ptr
  call void @intrinsic_print(ptr %t550)
  %t551 = load i64, ptr %local.t_net.380
  %t552 = call i64 @"print_f64"(i64 %t551)
  %t553 = load i64, ptr %local.t_net.380
  %t554 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.75)
  %t555 = call i64 @"sx_f64_lt"(i64 %t553, i64 %t554)
  %t556 = icmp ne i64 %t555, 0
  br i1 %t556, label %then29, label %else29
then29:
  %t557 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.76)
  %t558 = ptrtoint ptr %t557 to i64
  %t559 = inttoptr i64 %t558 to ptr
  call void @intrinsic_println(ptr %t559)
  br label %then29_end
then29_end:
  br label %endif29
else29:
  %t560 = load i64, ptr %local.t_net.380
  %t561 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.77)
  %t562 = call i64 @"sx_f64_gt"(i64 %t560, i64 %t561)
  %t563 = icmp ne i64 %t562, 0
  br i1 %t563, label %then30, label %else30
then30:
  %t564 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.78)
  %t565 = ptrtoint ptr %t564 to i64
  %t566 = inttoptr i64 %t565 to ptr
  call void @intrinsic_println(ptr %t566)
  br label %then30_end
then30_end:
  br label %endif30
else30:
  %t567 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.79)
  %t568 = ptrtoint ptr %t567 to i64
  %t569 = inttoptr i64 %t568 to ptr
  call void @intrinsic_println(ptr %t569)
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t570 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t571 = phi i64 [ 0, %then29_end ], [ %t570, %else29_end ]
  %t572 = load i64, ptr %local.k_val.373
  %t573 = add i64 %t572, 1
  store i64 %t573, ptr %local.k_val.373
  br label %loop28
endloop28:
  %t574 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.80)
  %t575 = ptrtoint ptr %t574 to i64
  %t576 = inttoptr i64 %t575 to ptr
  call void @intrinsic_println(ptr %t576)
  %t577 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.81)
  %t578 = ptrtoint ptr %t577 to i64
  %t579 = inttoptr i64 %t578 to ptr
  call void @intrinsic_print(ptr %t579)
  %t580 = load i64, ptr %local.sum_t.374
  %t581 = call i64 @"print_f64"(i64 %t580)
  %t582 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.82)
  %t583 = ptrtoint ptr %t582 to i64
  %t584 = inttoptr i64 %t583 to ptr
  call void @intrinsic_println(ptr %t584)
  %t585 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.83)
  %t586 = ptrtoint ptr %t585 to i64
  %t587 = inttoptr i64 %t586 to ptr
  call void @intrinsic_println(ptr %t587)
  %t588 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.84)
  %t589 = ptrtoint ptr %t588 to i64
  %t590 = inttoptr i64 %t589 to ptr
  call void @intrinsic_println(ptr %t590)
  %t591 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.85)
  %t592 = ptrtoint ptr %t591 to i64
  %t593 = inttoptr i64 %t592 to ptr
  call void @intrinsic_println(ptr %t593)
  %t594 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.86)
  %t595 = ptrtoint ptr %t594 to i64
  %t596 = inttoptr i64 %t595 to ptr
  call void @intrinsic_println(ptr %t596)
  %t597 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.87)
  %t598 = ptrtoint ptr %t597 to i64
  %t599 = inttoptr i64 %t598 to ptr
  call void @intrinsic_println(ptr %t599)
  store i64 2, ptr %local.n_val.381
  br label %loop31
loop31:
  %t600 = load i64, ptr %local.n_val.381
  %t601 = icmp sle i64 %t600, 8
  %t602 = zext i1 %t601 to i64
  %t603 = icmp ne i64 %t602, 0
  br i1 %t603, label %body31, label %endloop31
body31:
  %t604 = load i64, ptr %local.n_val.381
  %t605 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.88)
  %t606 = call i64 @"incoming"(i64 1, i64 0, i64 0, i64 %t604, i64 %t605)
  store i64 %t606, ptr %local.s_in.382
  %t607 = load i64, ptr %local.n_val.381
  %t608 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.89)
  %t609 = call i64 @"outgoing"(i64 1, i64 0, i64 0, i64 %t607, i64 %t608)
  store i64 %t609, ptr %local.s_out.383
  %t610 = load i64, ptr %local.s_in.382
  %t611 = load i64, ptr %local.s_out.383
  %t612 = call i64 @"sx_f64_sub"(i64 %t610, i64 %t611)
  store i64 %t612, ptr %local.t_net.384
  %t613 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.90)
  %t614 = ptrtoint ptr %t613 to i64
  %t615 = inttoptr i64 %t614 to ptr
  call void @intrinsic_print(ptr %t615)
  %t616 = load i64, ptr %local.n_val.381
  call void @print_i64(i64 %t616)
  %t617 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.91)
  %t618 = ptrtoint ptr %t617 to i64
  %t619 = inttoptr i64 %t618 to ptr
  call void @intrinsic_print(ptr %t619)
  %t620 = load i64, ptr %local.s_in.382
  %t621 = call i64 @"print_f64"(i64 %t620)
  %t622 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.92)
  %t623 = ptrtoint ptr %t622 to i64
  %t624 = inttoptr i64 %t623 to ptr
  call void @intrinsic_print(ptr %t624)
  %t625 = load i64, ptr %local.s_out.383
  %t626 = call i64 @"print_f64"(i64 %t625)
  %t627 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.93)
  %t628 = ptrtoint ptr %t627 to i64
  %t629 = inttoptr i64 %t628 to ptr
  call void @intrinsic_print(ptr %t629)
  %t630 = load i64, ptr %local.t_net.384
  %t631 = call i64 @"print_f64"(i64 %t630)
  %t632 = load i64, ptr %local.t_net.384
  %t633 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.94)
  %t634 = call i64 @"sx_f64_lt"(i64 %t632, i64 %t633)
  %t635 = icmp ne i64 %t634, 0
  br i1 %t635, label %then32, label %else32
then32:
  %t636 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.95)
  %t637 = ptrtoint ptr %t636 to i64
  %t638 = inttoptr i64 %t637 to ptr
  call void @intrinsic_println(ptr %t638)
  br label %then32_end
then32_end:
  br label %endif32
else32:
  %t639 = load i64, ptr %local.t_net.384
  %t640 = call i64 @f64_parse(ptr @.str.exp_ns_net_transfer.96)
  %t641 = call i64 @"sx_f64_gt"(i64 %t639, i64 %t640)
  %t642 = icmp ne i64 %t641, 0
  br i1 %t642, label %then33, label %else33
then33:
  %t643 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.97)
  %t644 = ptrtoint ptr %t643 to i64
  %t645 = inttoptr i64 %t644 to ptr
  call void @intrinsic_println(ptr %t645)
  br label %then33_end
then33_end:
  br label %endif33
else33:
  %t646 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.98)
  %t647 = ptrtoint ptr %t646 to i64
  %t648 = inttoptr i64 %t647 to ptr
  call void @intrinsic_println(ptr %t648)
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t649 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t650 = phi i64 [ 0, %then32_end ], [ %t649, %else32_end ]
  %t651 = load i64, ptr %local.n_val.381
  %t652 = add i64 %t651, 1
  store i64 %t652, ptr %local.n_val.381
  br label %loop31
endloop31:
  %t653 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.99)
  %t654 = ptrtoint ptr %t653 to i64
  %t655 = inttoptr i64 %t654 to ptr
  call void @intrinsic_println(ptr %t655)
  %t656 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.100)
  %t657 = ptrtoint ptr %t656 to i64
  %t658 = inttoptr i64 %t657 to ptr
  call void @intrinsic_println(ptr %t658)
  %t659 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.101)
  %t660 = ptrtoint ptr %t659 to i64
  %t661 = inttoptr i64 %t660 to ptr
  call void @intrinsic_println(ptr %t661)
  %t662 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.102)
  %t663 = ptrtoint ptr %t662 to i64
  %t664 = inttoptr i64 %t663 to ptr
  call void @intrinsic_println(ptr %t664)
  %t665 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.103)
  %t666 = ptrtoint ptr %t665 to i64
  %t667 = inttoptr i64 %t666 to ptr
  call void @intrinsic_println(ptr %t667)
  %t668 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.104)
  %t669 = ptrtoint ptr %t668 to i64
  %t670 = inttoptr i64 %t669 to ptr
  call void @intrinsic_println(ptr %t670)
  %t671 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.105)
  %t672 = ptrtoint ptr %t671 to i64
  %t673 = inttoptr i64 %t672 to ptr
  call void @intrinsic_println(ptr %t673)
  %t674 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.106)
  %t675 = ptrtoint ptr %t674 to i64
  %t676 = inttoptr i64 %t675 to ptr
  call void @intrinsic_println(ptr %t676)
  %t677 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.107)
  %t678 = ptrtoint ptr %t677 to i64
  %t679 = inttoptr i64 %t678 to ptr
  call void @intrinsic_println(ptr %t679)
  %t680 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.108)
  %t681 = ptrtoint ptr %t680 to i64
  %t682 = inttoptr i64 %t681 to ptr
  call void @intrinsic_println(ptr %t682)
  %t683 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.109)
  %t684 = ptrtoint ptr %t683 to i64
  %t685 = inttoptr i64 %t684 to ptr
  call void @intrinsic_println(ptr %t685)
  %t686 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.110)
  %t687 = ptrtoint ptr %t686 to i64
  %t688 = inttoptr i64 %t687 to ptr
  call void @intrinsic_println(ptr %t688)
  %t689 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.111)
  %t690 = ptrtoint ptr %t689 to i64
  %t691 = inttoptr i64 %t690 to ptr
  call void @intrinsic_println(ptr %t691)
  %t692 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.112)
  %t693 = ptrtoint ptr %t692 to i64
  %t694 = inttoptr i64 %t693 to ptr
  call void @intrinsic_println(ptr %t694)
  %t695 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.113)
  %t696 = ptrtoint ptr %t695 to i64
  %t697 = inttoptr i64 %t696 to ptr
  call void @intrinsic_println(ptr %t697)
  %t698 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.114)
  %t699 = ptrtoint ptr %t698 to i64
  %t700 = inttoptr i64 %t699 to ptr
  call void @intrinsic_println(ptr %t700)
  %t701 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.115)
  %t702 = ptrtoint ptr %t701 to i64
  %t703 = inttoptr i64 %t702 to ptr
  call void @intrinsic_println(ptr %t703)
  %t704 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.116)
  %t705 = ptrtoint ptr %t704 to i64
  %t706 = inttoptr i64 %t705 to ptr
  call void @intrinsic_println(ptr %t706)
  %t707 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_net_transfer.117)
  %t708 = ptrtoint ptr %t707 to i64
  %t709 = inttoptr i64 %t708 to ptr
  call void @intrinsic_println(ptr %t709)
  ret i64 0
}


; String constants
@.str.exp_ns_net_transfer.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.2 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.3 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.4 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_net_transfer.5 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.6 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_net_transfer.7 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_net_transfer.8 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_net_transfer.9 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_net_transfer.10 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_net_transfer.11 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_net_transfer.12 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_net_transfer.13 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_net_transfer.14 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_net_transfer.15 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_net_transfer.16 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_net_transfer.17 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_net_transfer.18 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.19 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.20 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_net_transfer.21 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_net_transfer.22 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_net_transfer.23 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_net_transfer.24 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_net_transfer.25 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_net_transfer.26 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_net_transfer.27 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_net_transfer.28 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_net_transfer.29 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_net_transfer.30 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_net_transfer.31 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_net_transfer.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.33 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_net_transfer.34 = private unnamed_addr constant [61 x i8] c"#  NET ENERGY TRANSFER: Forward vs Inverse Cascade         #\00"
@.str.exp_ns_net_transfer.35 = private unnamed_addr constant [61 x i8] c"#                                                          #\00"
@.str.exp_ns_net_transfer.36 = private unnamed_addr constant [60 x i8] c"#  T(k) = S_in(k) - S_out(k)                              #\00"
@.str.exp_ns_net_transfer.37 = private unnamed_addr constant [61 x i8] c"#                                                          #\00"
@.str.exp_ns_net_transfer.38 = private unnamed_addr constant [63 x i8] c"#  T(k) < 0 at low k → forward cascade → k=1 safe        #\00"
@.str.exp_ns_net_transfer.39 = private unnamed_addr constant [63 x i8] c"#  T(k) > 0 at low k → inverse cascade → k=1 at risk     #\00"
@.str.exp_ns_net_transfer.40 = private unnamed_addr constant [61 x i8] c"#                                                          #\00"
@.str.exp_ns_net_transfer.41 = private unnamed_addr constant [60 x i8] c"#  Energy conservation: sum_k T(k) = 0                    #\00"
@.str.exp_ns_net_transfer.42 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_net_transfer.43 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_net_transfer.44 = private unnamed_addr constant [66 x i8] c"  === Phase 1: Net transfer per |k| (N=6, s=0, flat spectrum) ===\00"
@.str.exp_ns_net_transfer.45 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_net_transfer.46 = private unnamed_addr constant [64 x i8] c"  |k|    S_in           S_out          T(k)=In-Out    Direction\00"
@.str.exp_ns_net_transfer.47 = private unnamed_addr constant [64 x i8] c"  ----   ----------     ----------     ----------     ---------\00"
@.str.exp_ns_net_transfer.48 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.49 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.50 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.51 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_net_transfer.52 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_net_transfer.53 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_net_transfer.54 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_net_transfer.55 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.56 = private unnamed_addr constant [26 x i8] c"   FORWARD (loses energy)\00"
@.str.exp_ns_net_transfer.57 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.58 = private unnamed_addr constant [26 x i8] c"   INVERSE (gains energy)\00"
@.str.exp_ns_net_transfer.59 = private unnamed_addr constant [11 x i8] c"   NEUTRAL\00"
@.str.exp_ns_net_transfer.60 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_net_transfer.61 = private unnamed_addr constant [14 x i8] c"  Sum T(k) = \00"
@.str.exp_ns_net_transfer.62 = private unnamed_addr constant [39 x i8] c" (should be ~0 by energy conservation)\00"
@.str.exp_ns_net_transfer.63 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_net_transfer.64 = private unnamed_addr constant [64 x i8] c"  === Phase 2: Net transfer per |k| (N=6, s=1, H1 spectrum) ===\00"
@.str.exp_ns_net_transfer.65 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_net_transfer.66 = private unnamed_addr constant [64 x i8] c"  |k|    S_in           S_out          T(k)=In-Out    Direction\00"
@.str.exp_ns_net_transfer.67 = private unnamed_addr constant [64 x i8] c"  ----   ----------     ----------     ----------     ---------\00"
@.str.exp_ns_net_transfer.68 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.69 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_net_transfer.70 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_net_transfer.71 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_net_transfer.72 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_net_transfer.73 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_net_transfer.74 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_net_transfer.75 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.76 = private unnamed_addr constant [26 x i8] c"   FORWARD (loses energy)\00"
@.str.exp_ns_net_transfer.77 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.78 = private unnamed_addr constant [26 x i8] c"   INVERSE (gains energy)\00"
@.str.exp_ns_net_transfer.79 = private unnamed_addr constant [11 x i8] c"   NEUTRAL\00"
@.str.exp_ns_net_transfer.80 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_net_transfer.81 = private unnamed_addr constant [14 x i8] c"  Sum T(k) = \00"
@.str.exp_ns_net_transfer.82 = private unnamed_addr constant [39 x i8] c" (should be ~0 by energy conservation)\00"
@.str.exp_ns_net_transfer.83 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_net_transfer.84 = private unnamed_addr constant [61 x i8] c"  === Phase 3: T(k=1) vs N (does k=1 accumulate energy?) ===\00"
@.str.exp_ns_net_transfer.85 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_net_transfer.86 = private unnamed_addr constant [64 x i8] c"  N      S_in(1)        S_out(1)       T(1)           Direction\00"
@.str.exp_ns_net_transfer.87 = private unnamed_addr constant [64 x i8] c"  ----   ----------     ----------     ----------     ---------\00"
@.str.exp_ns_net_transfer.88 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.89 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.90 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_net_transfer.91 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_net_transfer.92 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_net_transfer.93 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_net_transfer.94 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.95 = private unnamed_addr constant [11 x i8] c"   FORWARD\00"
@.str.exp_ns_net_transfer.96 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_net_transfer.97 = private unnamed_addr constant [11 x i8] c"   INVERSE\00"
@.str.exp_ns_net_transfer.98 = private unnamed_addr constant [11 x i8] c"   NEUTRAL\00"
@.str.exp_ns_net_transfer.99 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_net_transfer.100 = private unnamed_addr constant [30 x i8] c"  === Phase 4: Assessment ===\00"
@.str.exp_ns_net_transfer.101 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_net_transfer.102 = private unnamed_addr constant [28 x i8] c"  If T(k=1) <= 0 for all N:\00"
@.str.exp_ns_net_transfer.103 = private unnamed_addr constant [37 x i8] c"    → k=1 NEVER accumulates energy\00"
@.str.exp_ns_net_transfer.104 = private unnamed_addr constant [57 x i8] c"    → Forward cascade confirmed in exact Fourier basis\00"
@.str.exp_ns_net_transfer.105 = private unnamed_addr constant [67 x i8] c"    → The growing S_stretch(k=1) is offset by growing S_out(k=1)\00"
@.str.exp_ns_net_transfer.106 = private unnamed_addr constant [34 x i8] c"    → k=1 blow-up is impossible\00"
@.str.exp_ns_net_transfer.107 = private unnamed_addr constant [57 x i8] c"    → Combined with R(k) decay, the proof chain CLOSES\00"
@.str.exp_ns_net_transfer.108 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_net_transfer.109 = private unnamed_addr constant [28 x i8] c"  If T(k=1) > 0 for some N:\00"
@.str.exp_ns_net_transfer.110 = private unnamed_addr constant [40 x i8] c"    → Inverse cascade at large scales\00"
@.str.exp_ns_net_transfer.111 = private unnamed_addr constant [59 x i8] c"    → k=1 accumulates energy from nonlinear interactions\00"
@.str.exp_ns_net_transfer.112 = private unnamed_addr constant [59 x i8] c"    → Must check if diffusion at k=1 (nu*k^2) absorbs it\00"
@.str.exp_ns_net_transfer.113 = private unnamed_addr constant [52 x i8] c"    → The H/H'/H'' scaffold measures this balance\00"
@.str.exp_ns_net_transfer.114 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_net_transfer.115 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_net_transfer.116 = private unnamed_addr constant [61 x i8] c"#  NET TRANSFER COMPLETE                                   #\00"
@.str.exp_ns_net_transfer.117 = private unnamed_addr constant [61 x i8] c"############################################################\00"
