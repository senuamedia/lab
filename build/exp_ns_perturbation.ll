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
  %t1 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.1)
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

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t16 = load i64, ptr %local.x
  %t17 = load i64, ptr %local.lo
  %t18 = call i64 @"sx_f64_lt"(i64 %t16, i64 %t17)
  %t19 = icmp ne i64 %t18, 0
  br i1 %t19, label %then2, label %else2
then2:
  %t20 = load i64, ptr %local.lo
  ret i64 %t20
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t21 = phi i64 [ 0, %else2_end ]
  %t22 = load i64, ptr %local.x
  %t23 = load i64, ptr %local.hi
  %t24 = call i64 @"sx_f64_gt"(i64 %t22, i64 %t23)
  %t25 = icmp ne i64 %t24, 0
  br i1 %t25, label %then3, label %else3
then3:
  %t26 = load i64, ptr %local.hi
  ret i64 %t26
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t27 = phi i64 [ 0, %else3_end ]
  %t28 = load i64, ptr %local.x
  ret i64 %t28
}

define i64 @"bstep"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %nu, i64 %dt, i64 %dx, i64 %i) nounwind {
entry:
  %local.um.29 = alloca i64
  %local.ui.30 = alloca i64
  %local.up.31 = alloca i64
  %local.adv.32 = alloca i64
  %local.diff.33 = alloca i64
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
  %t34 = load i64, ptr %local.u4
  store i64 %t34, ptr %local.um.29
  %t35 = load i64, ptr %local.u0
  store i64 %t35, ptr %local.ui.30
  %t36 = load i64, ptr %local.u1
  store i64 %t36, ptr %local.up.31
  %t37 = load i64, ptr %local.i
  %t38 = icmp eq i64 %t37, 1
  %t39 = zext i1 %t38 to i64
  %t40 = icmp ne i64 %t39, 0
  br i1 %t40, label %then4, label %else4
then4:
  %t41 = load i64, ptr %local.u0
  store i64 %t41, ptr %local.um.29
  %t42 = load i64, ptr %local.u1
  store i64 %t42, ptr %local.ui.30
  %t43 = load i64, ptr %local.u2
  store i64 %t43, ptr %local.up.31
  br label %then4_end
then4_end:
  br label %endif4
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t44 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  %t45 = load i64, ptr %local.i
  %t46 = icmp eq i64 %t45, 2
  %t47 = zext i1 %t46 to i64
  %t48 = icmp ne i64 %t47, 0
  br i1 %t48, label %then5, label %else5
then5:
  %t49 = load i64, ptr %local.u1
  store i64 %t49, ptr %local.um.29
  %t50 = load i64, ptr %local.u2
  store i64 %t50, ptr %local.ui.30
  %t51 = load i64, ptr %local.u3
  store i64 %t51, ptr %local.up.31
  br label %then5_end
then5_end:
  br label %endif5
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t52 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t53 = load i64, ptr %local.i
  %t54 = icmp eq i64 %t53, 3
  %t55 = zext i1 %t54 to i64
  %t56 = icmp ne i64 %t55, 0
  br i1 %t56, label %then6, label %else6
then6:
  %t57 = load i64, ptr %local.u2
  store i64 %t57, ptr %local.um.29
  %t58 = load i64, ptr %local.u3
  store i64 %t58, ptr %local.ui.30
  %t59 = load i64, ptr %local.u4
  store i64 %t59, ptr %local.up.31
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t60 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t61 = load i64, ptr %local.i
  %t62 = icmp eq i64 %t61, 4
  %t63 = zext i1 %t62 to i64
  %t64 = icmp ne i64 %t63, 0
  br i1 %t64, label %then7, label %else7
then7:
  %t65 = load i64, ptr %local.u3
  store i64 %t65, ptr %local.um.29
  %t66 = load i64, ptr %local.u4
  store i64 %t66, ptr %local.ui.30
  %t67 = load i64, ptr %local.u0
  store i64 %t67, ptr %local.up.31
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t68 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t69 = load i64, ptr %local.ui.30
  %t70 = load i64, ptr %local.up.31
  %t71 = load i64, ptr %local.um.29
  %t72 = call i64 @"sx_f64_sub"(i64 %t70, i64 %t71)
  %t73 = call i64 @"sx_f64_mul"(i64 %t69, i64 %t72)
  %t74 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.2)
  %t75 = load i64, ptr %local.dx
  %t76 = call i64 @"sx_f64_mul"(i64 %t74, i64 %t75)
  %t77 = call i64 @"sx_f64_div"(i64 %t73, i64 %t76)
  store i64 %t77, ptr %local.adv.32
  %t78 = load i64, ptr %local.nu
  %t79 = load i64, ptr %local.up.31
  %t80 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.3)
  %t81 = load i64, ptr %local.ui.30
  %t82 = call i64 @"sx_f64_mul"(i64 %t80, i64 %t81)
  %t83 = call i64 @"sx_f64_sub"(i64 %t79, i64 %t82)
  %t84 = load i64, ptr %local.um.29
  %t85 = call i64 @"sx_f64_add"(i64 %t83, i64 %t84)
  %t86 = call i64 @"sx_f64_mul"(i64 %t78, i64 %t85)
  %t87 = load i64, ptr %local.dx
  %t88 = load i64, ptr %local.dx
  %t89 = call i64 @"sx_f64_mul"(i64 %t87, i64 %t88)
  %t90 = call i64 @"sx_f64_div"(i64 %t86, i64 %t89)
  store i64 %t90, ptr %local.diff.33
  %t91 = load i64, ptr %local.ui.30
  %t92 = load i64, ptr %local.dt
  %t93 = load i64, ptr %local.diff.33
  %t94 = load i64, ptr %local.adv.32
  %t95 = call i64 @"sx_f64_sub"(i64 %t93, i64 %t94)
  %t96 = call i64 @"sx_f64_mul"(i64 %t92, i64 %t95)
  %t97 = call i64 @"sx_f64_add"(i64 %t91, i64 %t96)
  ret i64 %t97
}

define i64 @"max_grad_5"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %dx) nounwind {
entry:
  %local.g0.98 = alloca i64
  %local.g1.99 = alloca i64
  %local.g2.100 = alloca i64
  %local.g3.101 = alloca i64
  %local.g4.102 = alloca i64
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
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %t103 = load i64, ptr %local.u1
  %t104 = load i64, ptr %local.u4
  %t105 = call i64 @"sx_f64_sub"(i64 %t103, i64 %t104)
  %t106 = call i64 @"abs_f64"(i64 %t105)
  %t107 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.4)
  %t108 = load i64, ptr %local.dx
  %t109 = call i64 @"sx_f64_mul"(i64 %t107, i64 %t108)
  %t110 = call i64 @"sx_f64_div"(i64 %t106, i64 %t109)
  store i64 %t110, ptr %local.g0.98
  %t111 = load i64, ptr %local.u2
  %t112 = load i64, ptr %local.u0
  %t113 = call i64 @"sx_f64_sub"(i64 %t111, i64 %t112)
  %t114 = call i64 @"abs_f64"(i64 %t113)
  %t115 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.5)
  %t116 = load i64, ptr %local.dx
  %t117 = call i64 @"sx_f64_mul"(i64 %t115, i64 %t116)
  %t118 = call i64 @"sx_f64_div"(i64 %t114, i64 %t117)
  store i64 %t118, ptr %local.g1.99
  %t119 = load i64, ptr %local.u3
  %t120 = load i64, ptr %local.u1
  %t121 = call i64 @"sx_f64_sub"(i64 %t119, i64 %t120)
  %t122 = call i64 @"abs_f64"(i64 %t121)
  %t123 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.6)
  %t124 = load i64, ptr %local.dx
  %t125 = call i64 @"sx_f64_mul"(i64 %t123, i64 %t124)
  %t126 = call i64 @"sx_f64_div"(i64 %t122, i64 %t125)
  store i64 %t126, ptr %local.g2.100
  %t127 = load i64, ptr %local.u4
  %t128 = load i64, ptr %local.u2
  %t129 = call i64 @"sx_f64_sub"(i64 %t127, i64 %t128)
  %t130 = call i64 @"abs_f64"(i64 %t129)
  %t131 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.7)
  %t132 = load i64, ptr %local.dx
  %t133 = call i64 @"sx_f64_mul"(i64 %t131, i64 %t132)
  %t134 = call i64 @"sx_f64_div"(i64 %t130, i64 %t133)
  store i64 %t134, ptr %local.g3.101
  %t135 = load i64, ptr %local.u0
  %t136 = load i64, ptr %local.u3
  %t137 = call i64 @"sx_f64_sub"(i64 %t135, i64 %t136)
  %t138 = call i64 @"abs_f64"(i64 %t137)
  %t139 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.8)
  %t140 = load i64, ptr %local.dx
  %t141 = call i64 @"sx_f64_mul"(i64 %t139, i64 %t140)
  %t142 = call i64 @"sx_f64_div"(i64 %t138, i64 %t141)
  store i64 %t142, ptr %local.g4.102
  %t143 = load i64, ptr %local.g0.98
  %t144 = load i64, ptr %local.g1.99
  %t145 = call i64 @"max_f64"(i64 %t143, i64 %t144)
  %t146 = load i64, ptr %local.g2.100
  %t147 = load i64, ptr %local.g3.101
  %t148 = call i64 @"max_f64"(i64 %t146, i64 %t147)
  %t149 = call i64 @"max_f64"(i64 %t145, i64 %t148)
  %t150 = load i64, ptr %local.g4.102
  %t151 = call i64 @"max_f64"(i64 %t149, i64 %t150)
  ret i64 %t151
}

define i64 @"probe_s"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %nu, i64 %dt, i64 %dx, i64 %probe_steps) nounwind {
entry:
  %local.a0.152 = alloca i64
  %local.a1.153 = alloca i64
  %local.a2.154 = alloca i64
  %local.a3.155 = alloca i64
  %local.a4.156 = alloca i64
  %local.step.157 = alloca i64
  %local.early_drift.158 = alloca i64
  %local.late_drift.159 = alloca i64
  %local.prev_grad.160 = alloca i64
  %local.grad.161 = alloca i64
  %local.count_e.162 = alloca i64
  %local.count_l.163 = alloca i64
  %local.half.164 = alloca i64
  %local.n0.165 = alloca i64
  %local.n1.166 = alloca i64
  %local.n2.167 = alloca i64
  %local.n3.168 = alloca i64
  %local.n4.169 = alloca i64
  %local.d.170 = alloca i64
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
  %local.probe_steps = alloca i64
  store i64 %probe_steps, ptr %local.probe_steps
  %t171 = load i64, ptr %local.u0
  store i64 %t171, ptr %local.a0.152
  %t172 = load i64, ptr %local.u1
  store i64 %t172, ptr %local.a1.153
  %t173 = load i64, ptr %local.u2
  store i64 %t173, ptr %local.a2.154
  %t174 = load i64, ptr %local.u3
  store i64 %t174, ptr %local.a3.155
  %t175 = load i64, ptr %local.u4
  store i64 %t175, ptr %local.a4.156
  store i64 0, ptr %local.step.157
  %t176 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.9)
  store i64 %t176, ptr %local.early_drift.158
  %t177 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.10)
  store i64 %t177, ptr %local.late_drift.159
  %t178 = load i64, ptr %local.a0.152
  %t179 = load i64, ptr %local.a1.153
  %t180 = load i64, ptr %local.a2.154
  %t181 = load i64, ptr %local.a3.155
  %t182 = load i64, ptr %local.a4.156
  %t183 = load i64, ptr %local.dx
  %t184 = call i64 @"max_grad_5"(i64 %t178, i64 %t179, i64 %t180, i64 %t181, i64 %t182, i64 %t183)
  store i64 %t184, ptr %local.prev_grad.160
  %t185 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.11)
  store i64 %t185, ptr %local.grad.161
  store i64 0, ptr %local.count_e.162
  store i64 0, ptr %local.count_l.163
  %t186 = load i64, ptr %local.probe_steps
  %t187 = sdiv i64 %t186, 2
  store i64 %t187, ptr %local.half.164
  br label %loop8
loop8:
  %t188 = load i64, ptr %local.step.157
  %t189 = load i64, ptr %local.probe_steps
  %t190 = icmp slt i64 %t188, %t189
  %t191 = zext i1 %t190 to i64
  %t192 = icmp ne i64 %t191, 0
  br i1 %t192, label %body8, label %endloop8
body8:
  %t193 = load i64, ptr %local.a0.152
  %t194 = load i64, ptr %local.a1.153
  %t195 = load i64, ptr %local.a2.154
  %t196 = load i64, ptr %local.a3.155
  %t197 = load i64, ptr %local.a4.156
  %t198 = load i64, ptr %local.nu
  %t199 = load i64, ptr %local.dt
  %t200 = load i64, ptr %local.dx
  %t201 = call i64 @"bstep"(i64 %t193, i64 %t194, i64 %t195, i64 %t196, i64 %t197, i64 %t198, i64 %t199, i64 %t200, i64 0)
  store i64 %t201, ptr %local.n0.165
  %t202 = load i64, ptr %local.a0.152
  %t203 = load i64, ptr %local.a1.153
  %t204 = load i64, ptr %local.a2.154
  %t205 = load i64, ptr %local.a3.155
  %t206 = load i64, ptr %local.a4.156
  %t207 = load i64, ptr %local.nu
  %t208 = load i64, ptr %local.dt
  %t209 = load i64, ptr %local.dx
  %t210 = call i64 @"bstep"(i64 %t202, i64 %t203, i64 %t204, i64 %t205, i64 %t206, i64 %t207, i64 %t208, i64 %t209, i64 1)
  store i64 %t210, ptr %local.n1.166
  %t211 = load i64, ptr %local.a0.152
  %t212 = load i64, ptr %local.a1.153
  %t213 = load i64, ptr %local.a2.154
  %t214 = load i64, ptr %local.a3.155
  %t215 = load i64, ptr %local.a4.156
  %t216 = load i64, ptr %local.nu
  %t217 = load i64, ptr %local.dt
  %t218 = load i64, ptr %local.dx
  %t219 = call i64 @"bstep"(i64 %t211, i64 %t212, i64 %t213, i64 %t214, i64 %t215, i64 %t216, i64 %t217, i64 %t218, i64 2)
  store i64 %t219, ptr %local.n2.167
  %t220 = load i64, ptr %local.a0.152
  %t221 = load i64, ptr %local.a1.153
  %t222 = load i64, ptr %local.a2.154
  %t223 = load i64, ptr %local.a3.155
  %t224 = load i64, ptr %local.a4.156
  %t225 = load i64, ptr %local.nu
  %t226 = load i64, ptr %local.dt
  %t227 = load i64, ptr %local.dx
  %t228 = call i64 @"bstep"(i64 %t220, i64 %t221, i64 %t222, i64 %t223, i64 %t224, i64 %t225, i64 %t226, i64 %t227, i64 3)
  store i64 %t228, ptr %local.n3.168
  %t229 = load i64, ptr %local.a0.152
  %t230 = load i64, ptr %local.a1.153
  %t231 = load i64, ptr %local.a2.154
  %t232 = load i64, ptr %local.a3.155
  %t233 = load i64, ptr %local.a4.156
  %t234 = load i64, ptr %local.nu
  %t235 = load i64, ptr %local.dt
  %t236 = load i64, ptr %local.dx
  %t237 = call i64 @"bstep"(i64 %t229, i64 %t230, i64 %t231, i64 %t232, i64 %t233, i64 %t234, i64 %t235, i64 %t236, i64 4)
  store i64 %t237, ptr %local.n4.169
  %t238 = load i64, ptr %local.n0.165
  store i64 %t238, ptr %local.a0.152
  %t239 = load i64, ptr %local.n1.166
  store i64 %t239, ptr %local.a1.153
  %t240 = load i64, ptr %local.n2.167
  store i64 %t240, ptr %local.a2.154
  %t241 = load i64, ptr %local.n3.168
  store i64 %t241, ptr %local.a3.155
  %t242 = load i64, ptr %local.n4.169
  store i64 %t242, ptr %local.a4.156
  %t243 = load i64, ptr %local.a0.152
  %t244 = load i64, ptr %local.a1.153
  %t245 = load i64, ptr %local.a2.154
  %t246 = load i64, ptr %local.a3.155
  %t247 = load i64, ptr %local.a4.156
  %t248 = load i64, ptr %local.dx
  %t249 = call i64 @"max_grad_5"(i64 %t243, i64 %t244, i64 %t245, i64 %t246, i64 %t247, i64 %t248)
  store i64 %t249, ptr %local.grad.161
  %t250 = load i64, ptr %local.grad.161
  %t251 = load i64, ptr %local.prev_grad.160
  %t252 = call i64 @"sx_f64_sub"(i64 %t250, i64 %t251)
  %t253 = call i64 @"abs_f64"(i64 %t252)
  store i64 %t253, ptr %local.d.170
  %t254 = load i64, ptr %local.step.157
  %t255 = load i64, ptr %local.half.164
  %t256 = icmp slt i64 %t254, %t255
  %t257 = zext i1 %t256 to i64
  %t258 = icmp ne i64 %t257, 0
  br i1 %t258, label %then9, label %else9
then9:
  %t259 = load i64, ptr %local.early_drift.158
  %t260 = load i64, ptr %local.d.170
  %t261 = call i64 @"sx_f64_add"(i64 %t259, i64 %t260)
  store i64 %t261, ptr %local.early_drift.158
  %t262 = load i64, ptr %local.count_e.162
  %t263 = add i64 %t262, 1
  store i64 %t263, ptr %local.count_e.162
  br label %then9_end
then9_end:
  br label %endif9
else9:
  %t264 = load i64, ptr %local.late_drift.159
  %t265 = load i64, ptr %local.d.170
  %t266 = call i64 @"sx_f64_add"(i64 %t264, i64 %t265)
  store i64 %t266, ptr %local.late_drift.159
  %t267 = load i64, ptr %local.count_l.163
  %t268 = add i64 %t267, 1
  store i64 %t268, ptr %local.count_l.163
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t269 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t270 = load i64, ptr %local.grad.161
  store i64 %t270, ptr %local.prev_grad.160
  %t271 = load i64, ptr %local.step.157
  %t272 = add i64 %t271, 1
  store i64 %t272, ptr %local.step.157
  br label %loop8
endloop8:
  %t273 = load i64, ptr %local.count_e.162
  %t274 = icmp sgt i64 %t273, 0
  %t275 = zext i1 %t274 to i64
  %t276 = icmp ne i64 %t275, 0
  br i1 %t276, label %then10, label %else10
then10:
  %t277 = load i64, ptr %local.early_drift.158
  %t278 = load i64, ptr %local.count_e.162
  %t279 = call i64 @"sx_int_to_f64"(i64 %t278)
  %t280 = call i64 @"sx_f64_div"(i64 %t277, i64 %t279)
  store i64 %t280, ptr %local.early_drift.158
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t281 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t282 = load i64, ptr %local.count_l.163
  %t283 = icmp sgt i64 %t282, 0
  %t284 = zext i1 %t283 to i64
  %t285 = icmp ne i64 %t284, 0
  br i1 %t285, label %then11, label %else11
then11:
  %t286 = load i64, ptr %local.late_drift.159
  %t287 = load i64, ptr %local.count_l.163
  %t288 = call i64 @"sx_int_to_f64"(i64 %t287)
  %t289 = call i64 @"sx_f64_div"(i64 %t286, i64 %t288)
  store i64 %t289, ptr %local.late_drift.159
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t290 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t291 = load i64, ptr %local.early_drift.158
  %t292 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.12)
  %t293 = call i64 @"sx_f64_gt"(i64 %t291, i64 %t292)
  %t294 = icmp ne i64 %t293, 0
  br i1 %t294, label %then12, label %else12
then12:
  %t295 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.13)
  %t296 = load i64, ptr %local.late_drift.159
  %t297 = load i64, ptr %local.early_drift.158
  %t298 = call i64 @"sx_f64_div"(i64 %t296, i64 %t297)
  %t299 = call i64 @"sx_f64_sub"(i64 %t295, i64 %t298)
  br label %then12_end
then12_end:
  br label %endif12
else12:
  %t300 = load i64, ptr %local.late_drift.159
  %t301 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.14)
  %t302 = call i64 @"sx_f64_lt"(i64 %t300, i64 %t301)
  %t303 = icmp ne i64 %t302, 0
  br i1 %t303, label %then13, label %else13
then13:
  %t304 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.15)
  br label %then13_end
then13_end:
  br label %endif13
else13:
  %t305 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.16)
  %t306 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.17)
  %t307 = call i64 @"sx_f64_sub"(i64 %t305, i64 %t306)
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t308 = phi i64 [ %t304, %then13_end ], [ %t307, %else13_end ]
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t309 = phi i64 [ %t299, %then12_end ], [ %t308, %else12_end ]
  ret i64 %t309
}

define i64 @"evolve_to"(i64 %t_steps, i64 %nu, i64 %dt, i64 %dx, i64 %which) nounwind {
entry:
  %local.pi.310 = alloca i64
  %local.u0.311 = alloca i64
  %local.u1.312 = alloca i64
  %local.u2.313 = alloca i64
  %local.u3.314 = alloca i64
  %local.u4.315 = alloca i64
  %local.step.316 = alloca i64
  %local.n0.317 = alloca i64
  %local.n1.318 = alloca i64
  %local.n2.319 = alloca i64
  %local.n3.320 = alloca i64
  %local.n4.321 = alloca i64
  %local.t_steps = alloca i64
  store i64 %t_steps, ptr %local.t_steps
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t322 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.18)
  store i64 %t322, ptr %local.pi.310
  %t323 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.19)
  %t324 = load i64, ptr %local.pi.310
  %t325 = call i64 @"sx_f64_mul"(i64 %t323, i64 %t324)
  %t326 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.20)
  %t327 = call i64 @"sx_f64_mul"(i64 %t325, i64 %t326)
  %t328 = call i64 @"sin_f64"(i64 %t327)
  store i64 %t328, ptr %local.u0.311
  %t329 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.21)
  %t330 = load i64, ptr %local.pi.310
  %t331 = call i64 @"sx_f64_mul"(i64 %t329, i64 %t330)
  %t332 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.22)
  %t333 = call i64 @"sx_f64_mul"(i64 %t331, i64 %t332)
  %t334 = call i64 @"sin_f64"(i64 %t333)
  store i64 %t334, ptr %local.u1.312
  %t335 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.23)
  %t336 = load i64, ptr %local.pi.310
  %t337 = call i64 @"sx_f64_mul"(i64 %t335, i64 %t336)
  %t338 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.24)
  %t339 = call i64 @"sx_f64_mul"(i64 %t337, i64 %t338)
  %t340 = call i64 @"sin_f64"(i64 %t339)
  store i64 %t340, ptr %local.u2.313
  %t341 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.25)
  %t342 = load i64, ptr %local.pi.310
  %t343 = call i64 @"sx_f64_mul"(i64 %t341, i64 %t342)
  %t344 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.26)
  %t345 = call i64 @"sx_f64_mul"(i64 %t343, i64 %t344)
  %t346 = call i64 @"sin_f64"(i64 %t345)
  store i64 %t346, ptr %local.u3.314
  %t347 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.27)
  %t348 = load i64, ptr %local.pi.310
  %t349 = call i64 @"sx_f64_mul"(i64 %t347, i64 %t348)
  %t350 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.28)
  %t351 = call i64 @"sx_f64_mul"(i64 %t349, i64 %t350)
  %t352 = call i64 @"sin_f64"(i64 %t351)
  store i64 %t352, ptr %local.u4.315
  store i64 0, ptr %local.step.316
  br label %loop14
loop14:
  %t353 = load i64, ptr %local.step.316
  %t354 = load i64, ptr %local.t_steps
  %t355 = icmp slt i64 %t353, %t354
  %t356 = zext i1 %t355 to i64
  %t357 = icmp ne i64 %t356, 0
  br i1 %t357, label %body14, label %endloop14
body14:
  %t358 = load i64, ptr %local.u0.311
  %t359 = load i64, ptr %local.u1.312
  %t360 = load i64, ptr %local.u2.313
  %t361 = load i64, ptr %local.u3.314
  %t362 = load i64, ptr %local.u4.315
  %t363 = load i64, ptr %local.nu
  %t364 = load i64, ptr %local.dt
  %t365 = load i64, ptr %local.dx
  %t366 = call i64 @"bstep"(i64 %t358, i64 %t359, i64 %t360, i64 %t361, i64 %t362, i64 %t363, i64 %t364, i64 %t365, i64 0)
  store i64 %t366, ptr %local.n0.317
  %t367 = load i64, ptr %local.u0.311
  %t368 = load i64, ptr %local.u1.312
  %t369 = load i64, ptr %local.u2.313
  %t370 = load i64, ptr %local.u3.314
  %t371 = load i64, ptr %local.u4.315
  %t372 = load i64, ptr %local.nu
  %t373 = load i64, ptr %local.dt
  %t374 = load i64, ptr %local.dx
  %t375 = call i64 @"bstep"(i64 %t367, i64 %t368, i64 %t369, i64 %t370, i64 %t371, i64 %t372, i64 %t373, i64 %t374, i64 1)
  store i64 %t375, ptr %local.n1.318
  %t376 = load i64, ptr %local.u0.311
  %t377 = load i64, ptr %local.u1.312
  %t378 = load i64, ptr %local.u2.313
  %t379 = load i64, ptr %local.u3.314
  %t380 = load i64, ptr %local.u4.315
  %t381 = load i64, ptr %local.nu
  %t382 = load i64, ptr %local.dt
  %t383 = load i64, ptr %local.dx
  %t384 = call i64 @"bstep"(i64 %t376, i64 %t377, i64 %t378, i64 %t379, i64 %t380, i64 %t381, i64 %t382, i64 %t383, i64 2)
  store i64 %t384, ptr %local.n2.319
  %t385 = load i64, ptr %local.u0.311
  %t386 = load i64, ptr %local.u1.312
  %t387 = load i64, ptr %local.u2.313
  %t388 = load i64, ptr %local.u3.314
  %t389 = load i64, ptr %local.u4.315
  %t390 = load i64, ptr %local.nu
  %t391 = load i64, ptr %local.dt
  %t392 = load i64, ptr %local.dx
  %t393 = call i64 @"bstep"(i64 %t385, i64 %t386, i64 %t387, i64 %t388, i64 %t389, i64 %t390, i64 %t391, i64 %t392, i64 3)
  store i64 %t393, ptr %local.n3.320
  %t394 = load i64, ptr %local.u0.311
  %t395 = load i64, ptr %local.u1.312
  %t396 = load i64, ptr %local.u2.313
  %t397 = load i64, ptr %local.u3.314
  %t398 = load i64, ptr %local.u4.315
  %t399 = load i64, ptr %local.nu
  %t400 = load i64, ptr %local.dt
  %t401 = load i64, ptr %local.dx
  %t402 = call i64 @"bstep"(i64 %t394, i64 %t395, i64 %t396, i64 %t397, i64 %t398, i64 %t399, i64 %t400, i64 %t401, i64 4)
  store i64 %t402, ptr %local.n4.321
  %t403 = load i64, ptr %local.n0.317
  store i64 %t403, ptr %local.u0.311
  %t404 = load i64, ptr %local.n1.318
  store i64 %t404, ptr %local.u1.312
  %t405 = load i64, ptr %local.n2.319
  store i64 %t405, ptr %local.u2.313
  %t406 = load i64, ptr %local.n3.320
  store i64 %t406, ptr %local.u3.314
  %t407 = load i64, ptr %local.n4.321
  store i64 %t407, ptr %local.u4.315
  %t408 = load i64, ptr %local.step.316
  %t409 = add i64 %t408, 1
  store i64 %t409, ptr %local.step.316
  br label %loop14
endloop14:
  %t410 = load i64, ptr %local.which
  %t411 = icmp eq i64 %t410, 0
  %t412 = zext i1 %t411 to i64
  %t413 = icmp ne i64 %t412, 0
  br i1 %t413, label %then15, label %else15
then15:
  %t414 = load i64, ptr %local.u0.311
  ret i64 %t414
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t415 = phi i64 [ 0, %else15_end ]
  %t416 = load i64, ptr %local.which
  %t417 = icmp eq i64 %t416, 1
  %t418 = zext i1 %t417 to i64
  %t419 = icmp ne i64 %t418, 0
  br i1 %t419, label %then16, label %else16
then16:
  %t420 = load i64, ptr %local.u1.312
  ret i64 %t420
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t421 = phi i64 [ 0, %else16_end ]
  %t422 = load i64, ptr %local.which
  %t423 = icmp eq i64 %t422, 2
  %t424 = zext i1 %t423 to i64
  %t425 = icmp ne i64 %t424, 0
  br i1 %t425, label %then17, label %else17
then17:
  %t426 = load i64, ptr %local.u2.313
  ret i64 %t426
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t427 = phi i64 [ 0, %else17_end ]
  %t428 = load i64, ptr %local.which
  %t429 = icmp eq i64 %t428, 3
  %t430 = zext i1 %t429 to i64
  %t431 = icmp ne i64 %t430, 0
  br i1 %t431, label %then18, label %else18
then18:
  %t432 = load i64, ptr %local.u3.314
  ret i64 %t432
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t433 = phi i64 [ 0, %else18_end ]
  %t434 = load i64, ptr %local.u4.315
  ret i64 %t434
}

define i64 @"test_perturbation_response"() nounwind {
entry:
  %local.nu.435 = alloca i64
  %local.dt.436 = alloca i64
  %local.dx.437 = alloca i64
  %local.epsilon.438 = alloca i64
  %local.probe_len.439 = alloca i64
  %local.t_step.440 = alloca i64
  %local.s0.441 = alloca i64
  %local.s1.442 = alloca i64
  %local.s2.443 = alloca i64
  %local.s3.444 = alloca i64
  %local.s4.445 = alloca i64
  %local.s_base.446 = alloca i64
  %local.s_kick.447 = alloca i64
  %local.margin.448 = alloca i64
  %t449 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.29)
  %t450 = ptrtoint ptr %t449 to i64
  %t451 = inttoptr i64 %t450 to ptr
  call void @intrinsic_println(ptr %t451)
  %t452 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.30)
  %t453 = ptrtoint ptr %t452 to i64
  %t454 = inttoptr i64 %t453 to ptr
  call void @intrinsic_println(ptr %t454)
  %t455 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.31)
  %t456 = ptrtoint ptr %t455 to i64
  %t457 = inttoptr i64 %t456 to ptr
  call void @intrinsic_println(ptr %t457)
  %t458 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.32)
  %t459 = ptrtoint ptr %t458 to i64
  %t460 = inttoptr i64 %t459 to ptr
  call void @intrinsic_println(ptr %t460)
  %t461 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.33)
  %t462 = ptrtoint ptr %t461 to i64
  %t463 = inttoptr i64 %t462 to ptr
  call void @intrinsic_println(ptr %t463)
  %t464 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.34)
  %t465 = ptrtoint ptr %t464 to i64
  %t466 = inttoptr i64 %t465 to ptr
  call void @intrinsic_println(ptr %t466)
  %t467 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.35)
  store i64 %t467, ptr %local.nu.435
  %t468 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.36)
  store i64 %t468, ptr %local.dt.436
  %t469 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.37)
  store i64 %t469, ptr %local.dx.437
  %t470 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.38)
  store i64 %t470, ptr %local.epsilon.438
  store i64 500, ptr %local.probe_len.439
  %t471 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.39)
  %t472 = ptrtoint ptr %t471 to i64
  %t473 = inttoptr i64 %t472 to ptr
  call void @intrinsic_println(ptr %t473)
  store i64 0, ptr %local.t_step.440
  br label %loop19
loop19:
  %t474 = load i64, ptr %local.t_step.440
  %t475 = icmp sle i64 %t474, 15000
  %t476 = zext i1 %t475 to i64
  %t477 = icmp ne i64 %t476, 0
  br i1 %t477, label %body19, label %endloop19
body19:
  %t478 = load i64, ptr %local.t_step.440
  %t479 = load i64, ptr %local.nu.435
  %t480 = load i64, ptr %local.dt.436
  %t481 = load i64, ptr %local.dx.437
  %t482 = call i64 @"evolve_to"(i64 %t478, i64 %t479, i64 %t480, i64 %t481, i64 0)
  store i64 %t482, ptr %local.s0.441
  %t483 = load i64, ptr %local.t_step.440
  %t484 = load i64, ptr %local.nu.435
  %t485 = load i64, ptr %local.dt.436
  %t486 = load i64, ptr %local.dx.437
  %t487 = call i64 @"evolve_to"(i64 %t483, i64 %t484, i64 %t485, i64 %t486, i64 1)
  store i64 %t487, ptr %local.s1.442
  %t488 = load i64, ptr %local.t_step.440
  %t489 = load i64, ptr %local.nu.435
  %t490 = load i64, ptr %local.dt.436
  %t491 = load i64, ptr %local.dx.437
  %t492 = call i64 @"evolve_to"(i64 %t488, i64 %t489, i64 %t490, i64 %t491, i64 2)
  store i64 %t492, ptr %local.s2.443
  %t493 = load i64, ptr %local.t_step.440
  %t494 = load i64, ptr %local.nu.435
  %t495 = load i64, ptr %local.dt.436
  %t496 = load i64, ptr %local.dx.437
  %t497 = call i64 @"evolve_to"(i64 %t493, i64 %t494, i64 %t495, i64 %t496, i64 3)
  store i64 %t497, ptr %local.s3.444
  %t498 = load i64, ptr %local.t_step.440
  %t499 = load i64, ptr %local.nu.435
  %t500 = load i64, ptr %local.dt.436
  %t501 = load i64, ptr %local.dx.437
  %t502 = call i64 @"evolve_to"(i64 %t498, i64 %t499, i64 %t500, i64 %t501, i64 4)
  store i64 %t502, ptr %local.s4.445
  %t503 = load i64, ptr %local.s0.441
  %t504 = load i64, ptr %local.s1.442
  %t505 = load i64, ptr %local.s2.443
  %t506 = load i64, ptr %local.s3.444
  %t507 = load i64, ptr %local.s4.445
  %t508 = load i64, ptr %local.nu.435
  %t509 = load i64, ptr %local.dt.436
  %t510 = load i64, ptr %local.dx.437
  %t511 = load i64, ptr %local.probe_len.439
  %t512 = call i64 @"probe_s"(i64 %t503, i64 %t504, i64 %t505, i64 %t506, i64 %t507, i64 %t508, i64 %t509, i64 %t510, i64 %t511)
  store i64 %t512, ptr %local.s_base.446
  %t513 = load i64, ptr %local.s0.441
  %t514 = load i64, ptr %local.s1.442
  %t515 = load i64, ptr %local.s2.443
  %t516 = load i64, ptr %local.epsilon.438
  %t517 = call i64 @"sx_f64_add"(i64 %t515, i64 %t516)
  %t518 = load i64, ptr %local.s3.444
  %t519 = load i64, ptr %local.s4.445
  %t520 = load i64, ptr %local.nu.435
  %t521 = load i64, ptr %local.dt.436
  %t522 = load i64, ptr %local.dx.437
  %t523 = load i64, ptr %local.probe_len.439
  %t524 = call i64 @"probe_s"(i64 %t513, i64 %t514, i64 %t517, i64 %t518, i64 %t519, i64 %t520, i64 %t521, i64 %t522, i64 %t523)
  store i64 %t524, ptr %local.s_kick.447
  %t525 = load i64, ptr %local.s_base.446
  %t526 = load i64, ptr %local.s_kick.447
  %t527 = call i64 @"sx_f64_sub"(i64 %t525, i64 %t526)
  %t528 = call i64 @"abs_f64"(i64 %t527)
  %t529 = load i64, ptr %local.epsilon.438
  %t530 = call i64 @"sx_f64_div"(i64 %t528, i64 %t529)
  store i64 %t530, ptr %local.margin.448
  %t531 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.40)
  %t532 = ptrtoint ptr %t531 to i64
  %t533 = inttoptr i64 %t532 to ptr
  call void @intrinsic_print(ptr %t533)
  %t534 = load i64, ptr %local.t_step.440
  call void @print_i64(i64 %t534)
  %t535 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.41)
  %t536 = ptrtoint ptr %t535 to i64
  %t537 = inttoptr i64 %t536 to ptr
  call void @intrinsic_print(ptr %t537)
  %t538 = load i64, ptr %local.s_base.446
  %t539 = call i64 @"print_f64"(i64 %t538)
  %t540 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.42)
  %t541 = ptrtoint ptr %t540 to i64
  %t542 = inttoptr i64 %t541 to ptr
  call void @intrinsic_print(ptr %t542)
  %t543 = load i64, ptr %local.s_kick.447
  %t544 = call i64 @"print_f64"(i64 %t543)
  %t545 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.43)
  %t546 = ptrtoint ptr %t545 to i64
  %t547 = inttoptr i64 %t546 to ptr
  call void @intrinsic_print(ptr %t547)
  %t548 = load i64, ptr %local.margin.448
  %t549 = call i64 @"print_f64"(i64 %t548)
  %t550 = load i64, ptr %local.margin.448
  %t551 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.44)
  %t552 = call i64 @"sx_f64_lt"(i64 %t550, i64 %t551)
  %t553 = icmp ne i64 %t552, 0
  br i1 %t553, label %then20, label %else20
then20:
  %t554 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.45)
  %t555 = ptrtoint ptr %t554 to i64
  %t556 = inttoptr i64 %t555 to ptr
  call void @intrinsic_println(ptr %t556)
  br label %then20_end
then20_end:
  br label %endif20
else20:
  %t557 = load i64, ptr %local.margin.448
  %t558 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.46)
  %t559 = call i64 @"sx_f64_lt"(i64 %t557, i64 %t558)
  %t560 = icmp ne i64 %t559, 0
  br i1 %t560, label %then21, label %else21
then21:
  %t561 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.47)
  %t562 = ptrtoint ptr %t561 to i64
  %t563 = inttoptr i64 %t562 to ptr
  call void @intrinsic_println(ptr %t563)
  br label %then21_end
then21_end:
  br label %endif21
else21:
  %t564 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.48)
  %t565 = ptrtoint ptr %t564 to i64
  %t566 = inttoptr i64 %t565 to ptr
  call void @intrinsic_println(ptr %t566)
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t567 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t568 = phi i64 [ 0, %then20_end ], [ %t567, %else20_end ]
  %t569 = load i64, ptr %local.t_step.440
  %t570 = add i64 %t569, 3000
  store i64 %t570, ptr %local.t_step.440
  br label %loop19
endloop19:
  %t571 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.49)
  %t572 = ptrtoint ptr %t571 to i64
  %t573 = inttoptr i64 %t572 to ptr
  call void @intrinsic_println(ptr %t573)
  ret i64 0
}

define i64 @"find_critical_epsilon"(i64 %t_steps, i64 %nu, i64 %dt, i64 %dx) nounwind {
entry:
  %local.s0.574 = alloca i64
  %local.s1.575 = alloca i64
  %local.s2.576 = alloca i64
  %local.s3.577 = alloca i64
  %local.s4.578 = alloca i64
  %local.eps.579 = alloca i64
  %local.crit.580 = alloca i64
  %local.sweep.581 = alloca i64
  %local.s_kick.582 = alloca i64
  %local.t_steps = alloca i64
  store i64 %t_steps, ptr %local.t_steps
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %t583 = load i64, ptr %local.t_steps
  %t584 = load i64, ptr %local.nu
  %t585 = load i64, ptr %local.dt
  %t586 = load i64, ptr %local.dx
  %t587 = call i64 @"evolve_to"(i64 %t583, i64 %t584, i64 %t585, i64 %t586, i64 0)
  store i64 %t587, ptr %local.s0.574
  %t588 = load i64, ptr %local.t_steps
  %t589 = load i64, ptr %local.nu
  %t590 = load i64, ptr %local.dt
  %t591 = load i64, ptr %local.dx
  %t592 = call i64 @"evolve_to"(i64 %t588, i64 %t589, i64 %t590, i64 %t591, i64 1)
  store i64 %t592, ptr %local.s1.575
  %t593 = load i64, ptr %local.t_steps
  %t594 = load i64, ptr %local.nu
  %t595 = load i64, ptr %local.dt
  %t596 = load i64, ptr %local.dx
  %t597 = call i64 @"evolve_to"(i64 %t593, i64 %t594, i64 %t595, i64 %t596, i64 2)
  store i64 %t597, ptr %local.s2.576
  %t598 = load i64, ptr %local.t_steps
  %t599 = load i64, ptr %local.nu
  %t600 = load i64, ptr %local.dt
  %t601 = load i64, ptr %local.dx
  %t602 = call i64 @"evolve_to"(i64 %t598, i64 %t599, i64 %t600, i64 %t601, i64 3)
  store i64 %t602, ptr %local.s3.577
  %t603 = load i64, ptr %local.t_steps
  %t604 = load i64, ptr %local.nu
  %t605 = load i64, ptr %local.dt
  %t606 = load i64, ptr %local.dx
  %t607 = call i64 @"evolve_to"(i64 %t603, i64 %t604, i64 %t605, i64 %t606, i64 4)
  store i64 %t607, ptr %local.s4.578
  %t608 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.50)
  store i64 %t608, ptr %local.eps.579
  %t609 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.51)
  store i64 %t609, ptr %local.crit.580
  store i64 0, ptr %local.sweep.581
  br label %loop22
loop22:
  %t610 = load i64, ptr %local.sweep.581
  %t611 = icmp slt i64 %t610, 10
  %t612 = zext i1 %t611 to i64
  %t613 = icmp ne i64 %t612, 0
  br i1 %t613, label %body22, label %endloop22
body22:
  %t614 = load i64, ptr %local.s0.574
  %t615 = load i64, ptr %local.s1.575
  %t616 = load i64, ptr %local.s2.576
  %t617 = load i64, ptr %local.eps.579
  %t618 = call i64 @"sx_f64_add"(i64 %t616, i64 %t617)
  %t619 = load i64, ptr %local.s3.577
  %t620 = load i64, ptr %local.s4.578
  %t621 = load i64, ptr %local.nu
  %t622 = load i64, ptr %local.dt
  %t623 = load i64, ptr %local.dx
  %t624 = call i64 @"probe_s"(i64 %t614, i64 %t615, i64 %t618, i64 %t619, i64 %t620, i64 %t621, i64 %t622, i64 %t623, i64 300)
  store i64 %t624, ptr %local.s_kick.582
  %t625 = load i64, ptr %local.s_kick.582
  %t626 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.52)
  %t627 = call i64 @"sx_f64_lt"(i64 %t625, i64 %t626)
  %t628 = icmp ne i64 %t627, 0
  br i1 %t628, label %then23, label %else23
then23:
  %t629 = load i64, ptr %local.eps.579
  %t630 = load i64, ptr %local.crit.580
  %t631 = call i64 @"sx_f64_lt"(i64 %t629, i64 %t630)
  %t632 = icmp ne i64 %t631, 0
  br i1 %t632, label %then24, label %else24
then24:
  %t633 = load i64, ptr %local.eps.579
  store i64 %t633, ptr %local.crit.580
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t634 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t635 = phi i64 [ %t634, %then23_end ], [ 0, %else23_end ]
  %t636 = load i64, ptr %local.eps.579
  %t637 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.53)
  %t638 = call i64 @"sx_f64_mul"(i64 %t636, i64 %t637)
  store i64 %t638, ptr %local.eps.579
  %t639 = load i64, ptr %local.sweep.581
  %t640 = add i64 %t639, 1
  store i64 %t640, ptr %local.sweep.581
  br label %loop22
endloop22:
  %t641 = load i64, ptr %local.crit.580
  ret i64 %t641
}

define i64 @"test_critical_epsilon"() nounwind {
entry:
  %local.nu.642 = alloca i64
  %local.dt.643 = alloca i64
  %local.dx.644 = alloca i64
  %local.t.645 = alloca i64
  %local.crit.646 = alloca i64
  %t647 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.54)
  %t648 = ptrtoint ptr %t647 to i64
  %t649 = inttoptr i64 %t648 to ptr
  call void @intrinsic_println(ptr %t649)
  %t650 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.55)
  %t651 = ptrtoint ptr %t650 to i64
  %t652 = inttoptr i64 %t651 to ptr
  call void @intrinsic_println(ptr %t652)
  %t653 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.56)
  %t654 = ptrtoint ptr %t653 to i64
  %t655 = inttoptr i64 %t654 to ptr
  call void @intrinsic_println(ptr %t655)
  %t656 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.57)
  %t657 = ptrtoint ptr %t656 to i64
  %t658 = inttoptr i64 %t657 to ptr
  call void @intrinsic_println(ptr %t658)
  %t659 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.58)
  store i64 %t659, ptr %local.nu.642
  %t660 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.59)
  store i64 %t660, ptr %local.dt.643
  %t661 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.60)
  store i64 %t661, ptr %local.dx.644
  %t662 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.61)
  %t663 = ptrtoint ptr %t662 to i64
  %t664 = inttoptr i64 %t663 to ptr
  call void @intrinsic_println(ptr %t664)
  store i64 0, ptr %local.t.645
  br label %loop25
loop25:
  %t665 = load i64, ptr %local.t.645
  %t666 = icmp sle i64 %t665, 15000
  %t667 = zext i1 %t666 to i64
  %t668 = icmp ne i64 %t667, 0
  br i1 %t668, label %body25, label %endloop25
body25:
  %t669 = load i64, ptr %local.t.645
  %t670 = load i64, ptr %local.nu.642
  %t671 = load i64, ptr %local.dt.643
  %t672 = load i64, ptr %local.dx.644
  %t673 = call i64 @"find_critical_epsilon"(i64 %t669, i64 %t670, i64 %t671, i64 %t672)
  store i64 %t673, ptr %local.crit.646
  %t674 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.62)
  %t675 = ptrtoint ptr %t674 to i64
  %t676 = inttoptr i64 %t675 to ptr
  call void @intrinsic_print(ptr %t676)
  %t677 = load i64, ptr %local.t.645
  call void @print_i64(i64 %t677)
  %t678 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.63)
  %t679 = ptrtoint ptr %t678 to i64
  %t680 = inttoptr i64 %t679 to ptr
  call void @intrinsic_print(ptr %t680)
  %t681 = load i64, ptr %local.crit.646
  %t682 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.64)
  %t683 = call i64 @"sx_f64_gt"(i64 %t681, i64 %t682)
  %t684 = icmp ne i64 %t683, 0
  br i1 %t684, label %then26, label %else26
then26:
  %t685 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.65)
  %t686 = ptrtoint ptr %t685 to i64
  %t687 = inttoptr i64 %t686 to ptr
  call void @intrinsic_println(ptr %t687)
  br label %then26_end
then26_end:
  br label %endif26
else26:
  %t688 = load i64, ptr %local.crit.646
  %t689 = call i64 @"print_f64"(i64 %t688)
  %t690 = load i64, ptr %local.crit.646
  %t691 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.66)
  %t692 = call i64 @"sx_f64_gt"(i64 %t690, i64 %t691)
  %t693 = icmp ne i64 %t692, 0
  br i1 %t693, label %then27, label %else27
then27:
  %t694 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.67)
  %t695 = ptrtoint ptr %t694 to i64
  %t696 = inttoptr i64 %t695 to ptr
  call void @intrinsic_println(ptr %t696)
  br label %then27_end
then27_end:
  br label %endif27
else27:
  %t697 = load i64, ptr %local.crit.646
  %t698 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.68)
  %t699 = call i64 @"sx_f64_gt"(i64 %t697, i64 %t698)
  %t700 = icmp ne i64 %t699, 0
  br i1 %t700, label %then28, label %else28
then28:
  %t701 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.69)
  %t702 = ptrtoint ptr %t701 to i64
  %t703 = inttoptr i64 %t702 to ptr
  call void @intrinsic_println(ptr %t703)
  br label %then28_end
then28_end:
  br label %endif28
else28:
  %t704 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.70)
  %t705 = ptrtoint ptr %t704 to i64
  %t706 = inttoptr i64 %t705 to ptr
  call void @intrinsic_println(ptr %t706)
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t707 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t708 = phi i64 [ 0, %then27_end ], [ %t707, %else27_end ]
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t709 = phi i64 [ 0, %then26_end ], [ %t708, %else26_end ]
  %t710 = load i64, ptr %local.t.645
  %t711 = add i64 %t710, 3000
  store i64 %t711, ptr %local.t.645
  br label %loop25
endloop25:
  %t712 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.71)
  %t713 = ptrtoint ptr %t712 to i64
  %t714 = inttoptr i64 %t713 to ptr
  call void @intrinsic_println(ptr %t714)
  ret i64 0
}

define i64 @"test_perturbation_types"() nounwind {
entry:
  %local.nu.715 = alloca i64
  %local.dt.716 = alloca i64
  %local.dx.717 = alloca i64
  %local.eps.718 = alloca i64
  %local.probe_len.719 = alloca i64
  %local.t.720 = alloca i64
  %local.s0.721 = alloca i64
  %local.s1.722 = alloca i64
  %local.s2.723 = alloca i64
  %local.s3.724 = alloca i64
  %local.s4.725 = alloca i64
  %local.sb.726 = alloca i64
  %local.sa.727 = alloca i64
  %local.sg.728 = alloca i64
  %local.fac.729 = alloca i64
  %local.se.730 = alloca i64
  %local.da.731 = alloca i64
  %local.dg.732 = alloca i64
  %local.de.733 = alloca i64
  %t734 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.72)
  %t735 = ptrtoint ptr %t734 to i64
  %t736 = inttoptr i64 %t735 to ptr
  call void @intrinsic_println(ptr %t736)
  %t737 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.73)
  %t738 = ptrtoint ptr %t737 to i64
  %t739 = inttoptr i64 %t738 to ptr
  call void @intrinsic_println(ptr %t739)
  %t740 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.74)
  %t741 = ptrtoint ptr %t740 to i64
  %t742 = inttoptr i64 %t741 to ptr
  call void @intrinsic_println(ptr %t742)
  %t743 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.75)
  %t744 = ptrtoint ptr %t743 to i64
  %t745 = inttoptr i64 %t744 to ptr
  call void @intrinsic_println(ptr %t745)
  %t746 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.76)
  %t747 = ptrtoint ptr %t746 to i64
  %t748 = inttoptr i64 %t747 to ptr
  call void @intrinsic_println(ptr %t748)
  %t749 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.77)
  store i64 %t749, ptr %local.nu.715
  %t750 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.78)
  store i64 %t750, ptr %local.dt.716
  %t751 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.79)
  store i64 %t751, ptr %local.dx.717
  %t752 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.80)
  store i64 %t752, ptr %local.eps.718
  store i64 500, ptr %local.probe_len.719
  %t753 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.81)
  %t754 = ptrtoint ptr %t753 to i64
  %t755 = inttoptr i64 %t754 to ptr
  call void @intrinsic_println(ptr %t755)
  store i64 0, ptr %local.t.720
  br label %loop29
loop29:
  %t756 = load i64, ptr %local.t.720
  %t757 = icmp sle i64 %t756, 12000
  %t758 = zext i1 %t757 to i64
  %t759 = icmp ne i64 %t758, 0
  br i1 %t759, label %body29, label %endloop29
body29:
  %t760 = load i64, ptr %local.t.720
  %t761 = load i64, ptr %local.nu.715
  %t762 = load i64, ptr %local.dt.716
  %t763 = load i64, ptr %local.dx.717
  %t764 = call i64 @"evolve_to"(i64 %t760, i64 %t761, i64 %t762, i64 %t763, i64 0)
  store i64 %t764, ptr %local.s0.721
  %t765 = load i64, ptr %local.t.720
  %t766 = load i64, ptr %local.nu.715
  %t767 = load i64, ptr %local.dt.716
  %t768 = load i64, ptr %local.dx.717
  %t769 = call i64 @"evolve_to"(i64 %t765, i64 %t766, i64 %t767, i64 %t768, i64 1)
  store i64 %t769, ptr %local.s1.722
  %t770 = load i64, ptr %local.t.720
  %t771 = load i64, ptr %local.nu.715
  %t772 = load i64, ptr %local.dt.716
  %t773 = load i64, ptr %local.dx.717
  %t774 = call i64 @"evolve_to"(i64 %t770, i64 %t771, i64 %t772, i64 %t773, i64 2)
  store i64 %t774, ptr %local.s2.723
  %t775 = load i64, ptr %local.t.720
  %t776 = load i64, ptr %local.nu.715
  %t777 = load i64, ptr %local.dt.716
  %t778 = load i64, ptr %local.dx.717
  %t779 = call i64 @"evolve_to"(i64 %t775, i64 %t776, i64 %t777, i64 %t778, i64 3)
  store i64 %t779, ptr %local.s3.724
  %t780 = load i64, ptr %local.t.720
  %t781 = load i64, ptr %local.nu.715
  %t782 = load i64, ptr %local.dt.716
  %t783 = load i64, ptr %local.dx.717
  %t784 = call i64 @"evolve_to"(i64 %t780, i64 %t781, i64 %t782, i64 %t783, i64 4)
  store i64 %t784, ptr %local.s4.725
  %t785 = load i64, ptr %local.s0.721
  %t786 = load i64, ptr %local.s1.722
  %t787 = load i64, ptr %local.s2.723
  %t788 = load i64, ptr %local.s3.724
  %t789 = load i64, ptr %local.s4.725
  %t790 = load i64, ptr %local.nu.715
  %t791 = load i64, ptr %local.dt.716
  %t792 = load i64, ptr %local.dx.717
  %t793 = load i64, ptr %local.probe_len.719
  %t794 = call i64 @"probe_s"(i64 %t785, i64 %t786, i64 %t787, i64 %t788, i64 %t789, i64 %t790, i64 %t791, i64 %t792, i64 %t793)
  store i64 %t794, ptr %local.sb.726
  %t795 = load i64, ptr %local.s0.721
  %t796 = load i64, ptr %local.s1.722
  %t797 = load i64, ptr %local.s2.723
  %t798 = load i64, ptr %local.eps.718
  %t799 = call i64 @"sx_f64_add"(i64 %t797, i64 %t798)
  %t800 = load i64, ptr %local.s3.724
  %t801 = load i64, ptr %local.s4.725
  %t802 = load i64, ptr %local.nu.715
  %t803 = load i64, ptr %local.dt.716
  %t804 = load i64, ptr %local.dx.717
  %t805 = load i64, ptr %local.probe_len.719
  %t806 = call i64 @"probe_s"(i64 %t795, i64 %t796, i64 %t799, i64 %t800, i64 %t801, i64 %t802, i64 %t803, i64 %t804, i64 %t805)
  store i64 %t806, ptr %local.sa.727
  %t807 = load i64, ptr %local.s0.721
  %t808 = load i64, ptr %local.s1.722
  %t809 = load i64, ptr %local.s2.723
  %t810 = load i64, ptr %local.eps.718
  %t811 = call i64 @"sx_f64_add"(i64 %t809, i64 %t810)
  %t812 = load i64, ptr %local.s3.724
  %t813 = load i64, ptr %local.eps.718
  %t814 = call i64 @"sx_f64_sub"(i64 %t812, i64 %t813)
  %t815 = load i64, ptr %local.s4.725
  %t816 = load i64, ptr %local.nu.715
  %t817 = load i64, ptr %local.dt.716
  %t818 = load i64, ptr %local.dx.717
  %t819 = load i64, ptr %local.probe_len.719
  %t820 = call i64 @"probe_s"(i64 %t807, i64 %t808, i64 %t811, i64 %t814, i64 %t815, i64 %t816, i64 %t817, i64 %t818, i64 %t819)
  store i64 %t820, ptr %local.sg.728
  %t821 = call i64 @f64_parse(ptr @.str.exp_ns_perturbation.82)
  %t822 = load i64, ptr %local.eps.718
  %t823 = call i64 @"sx_f64_add"(i64 %t821, i64 %t822)
  store i64 %t823, ptr %local.fac.729
  %t824 = load i64, ptr %local.s0.721
  %t825 = load i64, ptr %local.fac.729
  %t826 = call i64 @"sx_f64_mul"(i64 %t824, i64 %t825)
  %t827 = load i64, ptr %local.s1.722
  %t828 = load i64, ptr %local.fac.729
  %t829 = call i64 @"sx_f64_mul"(i64 %t827, i64 %t828)
  %t830 = load i64, ptr %local.s2.723
  %t831 = load i64, ptr %local.fac.729
  %t832 = call i64 @"sx_f64_mul"(i64 %t830, i64 %t831)
  %t833 = load i64, ptr %local.s3.724
  %t834 = load i64, ptr %local.fac.729
  %t835 = call i64 @"sx_f64_mul"(i64 %t833, i64 %t834)
  %t836 = load i64, ptr %local.s4.725
  %t837 = load i64, ptr %local.fac.729
  %t838 = call i64 @"sx_f64_mul"(i64 %t836, i64 %t837)
  %t839 = load i64, ptr %local.nu.715
  %t840 = load i64, ptr %local.dt.716
  %t841 = load i64, ptr %local.dx.717
  %t842 = load i64, ptr %local.probe_len.719
  %t843 = call i64 @"probe_s"(i64 %t826, i64 %t829, i64 %t832, i64 %t835, i64 %t838, i64 %t839, i64 %t840, i64 %t841, i64 %t842)
  store i64 %t843, ptr %local.se.730
  %t844 = load i64, ptr %local.sb.726
  %t845 = load i64, ptr %local.sa.727
  %t846 = call i64 @"sx_f64_sub"(i64 %t844, i64 %t845)
  %t847 = call i64 @"abs_f64"(i64 %t846)
  store i64 %t847, ptr %local.da.731
  %t848 = load i64, ptr %local.sb.726
  %t849 = load i64, ptr %local.sg.728
  %t850 = call i64 @"sx_f64_sub"(i64 %t848, i64 %t849)
  %t851 = call i64 @"abs_f64"(i64 %t850)
  store i64 %t851, ptr %local.dg.732
  %t852 = load i64, ptr %local.sb.726
  %t853 = load i64, ptr %local.se.730
  %t854 = call i64 @"sx_f64_sub"(i64 %t852, i64 %t853)
  %t855 = call i64 @"abs_f64"(i64 %t854)
  store i64 %t855, ptr %local.de.733
  %t856 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.83)
  %t857 = ptrtoint ptr %t856 to i64
  %t858 = inttoptr i64 %t857 to ptr
  call void @intrinsic_print(ptr %t858)
  %t859 = load i64, ptr %local.t.720
  call void @print_i64(i64 %t859)
  %t860 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.84)
  %t861 = ptrtoint ptr %t860 to i64
  %t862 = inttoptr i64 %t861 to ptr
  call void @intrinsic_print(ptr %t862)
  %t863 = load i64, ptr %local.sb.726
  %t864 = call i64 @"print_f64"(i64 %t863)
  %t865 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.85)
  %t866 = ptrtoint ptr %t865 to i64
  %t867 = inttoptr i64 %t866 to ptr
  call void @intrinsic_print(ptr %t867)
  %t868 = load i64, ptr %local.sa.727
  %t869 = call i64 @"print_f64"(i64 %t868)
  %t870 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.86)
  %t871 = ptrtoint ptr %t870 to i64
  %t872 = inttoptr i64 %t871 to ptr
  call void @intrinsic_print(ptr %t872)
  %t873 = load i64, ptr %local.sg.728
  %t874 = call i64 @"print_f64"(i64 %t873)
  %t875 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.87)
  %t876 = ptrtoint ptr %t875 to i64
  %t877 = inttoptr i64 %t876 to ptr
  call void @intrinsic_print(ptr %t877)
  %t878 = load i64, ptr %local.se.730
  %t879 = call i64 @"print_f64"(i64 %t878)
  %t880 = load i64, ptr %local.dg.732
  %t881 = load i64, ptr %local.da.731
  %t882 = call i64 @"sx_f64_gt"(i64 %t880, i64 %t881)
  %t883 = icmp ne i64 %t882, 0
  br i1 %t883, label %then30, label %else30
then30:
  %t884 = load i64, ptr %local.dg.732
  %t885 = load i64, ptr %local.de.733
  %t886 = call i64 @"sx_f64_gt"(i64 %t884, i64 %t885)
  %t887 = icmp ne i64 %t886, 0
  br i1 %t887, label %then31, label %else31
then31:
  %t888 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.88)
  %t889 = ptrtoint ptr %t888 to i64
  %t890 = inttoptr i64 %t889 to ptr
  call void @intrinsic_println(ptr %t890)
  br label %then31_end
then31_end:
  br label %endif31
else31:
  %t891 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.89)
  %t892 = ptrtoint ptr %t891 to i64
  %t893 = inttoptr i64 %t892 to ptr
  call void @intrinsic_println(ptr %t893)
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t894 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  br label %then30_end
then30_end:
  br label %endif30
else30:
  %t895 = load i64, ptr %local.da.731
  %t896 = load i64, ptr %local.de.733
  %t897 = call i64 @"sx_f64_gt"(i64 %t895, i64 %t896)
  %t898 = icmp ne i64 %t897, 0
  br i1 %t898, label %then32, label %else32
then32:
  %t899 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.90)
  %t900 = ptrtoint ptr %t899 to i64
  %t901 = inttoptr i64 %t900 to ptr
  call void @intrinsic_println(ptr %t901)
  br label %then32_end
then32_end:
  br label %endif32
else32:
  %t902 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.91)
  %t903 = ptrtoint ptr %t902 to i64
  %t904 = inttoptr i64 %t903 to ptr
  call void @intrinsic_println(ptr %t904)
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t905 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t906 = phi i64 [ %t894, %then30_end ], [ %t905, %else30_end ]
  %t907 = load i64, ptr %local.t.720
  %t908 = add i64 %t907, 3000
  store i64 %t908, ptr %local.t.720
  br label %loop29
endloop29:
  %t909 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.92)
  %t910 = ptrtoint ptr %t909 to i64
  %t911 = inttoptr i64 %t910 to ptr
  call void @intrinsic_println(ptr %t911)
  %t912 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.93)
  %t913 = ptrtoint ptr %t912 to i64
  %t914 = inttoptr i64 %t913 to ptr
  call void @intrinsic_println(ptr %t914)
  %t915 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.94)
  %t916 = ptrtoint ptr %t915 to i64
  %t917 = inttoptr i64 %t916 to ptr
  call void @intrinsic_println(ptr %t917)
  %t918 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.95)
  %t919 = ptrtoint ptr %t918 to i64
  %t920 = inttoptr i64 %t919 to ptr
  call void @intrinsic_println(ptr %t920)
  %t921 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.96)
  %t922 = ptrtoint ptr %t921 to i64
  %t923 = inttoptr i64 %t922 to ptr
  call void @intrinsic_println(ptr %t923)
  %t924 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.97)
  %t925 = ptrtoint ptr %t924 to i64
  %t926 = inttoptr i64 %t925 to ptr
  call void @intrinsic_println(ptr %t926)
  %t927 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.98)
  %t928 = ptrtoint ptr %t927 to i64
  %t929 = inttoptr i64 %t928 to ptr
  call void @intrinsic_println(ptr %t929)
  %t930 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.99)
  %t931 = ptrtoint ptr %t930 to i64
  %t932 = inttoptr i64 %t931 to ptr
  call void @intrinsic_println(ptr %t932)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t933 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.100)
  %t934 = ptrtoint ptr %t933 to i64
  %t935 = inttoptr i64 %t934 to ptr
  call void @intrinsic_println(ptr %t935)
  %t936 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.101)
  %t937 = ptrtoint ptr %t936 to i64
  %t938 = inttoptr i64 %t937 to ptr
  call void @intrinsic_println(ptr %t938)
  %t939 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.102)
  %t940 = ptrtoint ptr %t939 to i64
  %t941 = inttoptr i64 %t940 to ptr
  call void @intrinsic_println(ptr %t941)
  %t942 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.103)
  %t943 = ptrtoint ptr %t942 to i64
  %t944 = inttoptr i64 %t943 to ptr
  call void @intrinsic_println(ptr %t944)
  %t945 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.104)
  %t946 = ptrtoint ptr %t945 to i64
  %t947 = inttoptr i64 %t946 to ptr
  call void @intrinsic_println(ptr %t947)
  %t948 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.105)
  %t949 = ptrtoint ptr %t948 to i64
  %t950 = inttoptr i64 %t949 to ptr
  call void @intrinsic_println(ptr %t950)
  %t951 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.106)
  %t952 = ptrtoint ptr %t951 to i64
  %t953 = inttoptr i64 %t952 to ptr
  call void @intrinsic_println(ptr %t953)
  %t954 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.107)
  %t955 = ptrtoint ptr %t954 to i64
  %t956 = inttoptr i64 %t955 to ptr
  call void @intrinsic_println(ptr %t956)
  %t957 = call i64 @"test_perturbation_response"()
  %t958 = call i64 @"test_critical_epsilon"()
  %t959 = call i64 @"test_perturbation_types"()
  %t960 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.108)
  %t961 = ptrtoint ptr %t960 to i64
  %t962 = inttoptr i64 %t961 to ptr
  call void @intrinsic_println(ptr %t962)
  %t963 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.109)
  %t964 = ptrtoint ptr %t963 to i64
  %t965 = inttoptr i64 %t964 to ptr
  call void @intrinsic_println(ptr %t965)
  %t966 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.110)
  %t967 = ptrtoint ptr %t966 to i64
  %t968 = inttoptr i64 %t967 to ptr
  call void @intrinsic_println(ptr %t968)
  %t969 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.111)
  %t970 = ptrtoint ptr %t969 to i64
  %t971 = inttoptr i64 %t970 to ptr
  call void @intrinsic_println(ptr %t971)
  %t972 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.112)
  %t973 = ptrtoint ptr %t972 to i64
  %t974 = inttoptr i64 %t973 to ptr
  call void @intrinsic_println(ptr %t974)
  %t975 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.113)
  %t976 = ptrtoint ptr %t975 to i64
  %t977 = inttoptr i64 %t976 to ptr
  call void @intrinsic_println(ptr %t977)
  %t978 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.114)
  %t979 = ptrtoint ptr %t978 to i64
  %t980 = inttoptr i64 %t979 to ptr
  call void @intrinsic_println(ptr %t980)
  %t981 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.115)
  %t982 = ptrtoint ptr %t981 to i64
  %t983 = inttoptr i64 %t982 to ptr
  call void @intrinsic_println(ptr %t983)
  %t984 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.116)
  %t985 = ptrtoint ptr %t984 to i64
  %t986 = inttoptr i64 %t985 to ptr
  call void @intrinsic_println(ptr %t986)
  %t987 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.117)
  %t988 = ptrtoint ptr %t987 to i64
  %t989 = inttoptr i64 %t988 to ptr
  call void @intrinsic_println(ptr %t989)
  %t990 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.118)
  %t991 = ptrtoint ptr %t990 to i64
  %t992 = inttoptr i64 %t991 to ptr
  call void @intrinsic_println(ptr %t992)
  %t993 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.119)
  %t994 = ptrtoint ptr %t993 to i64
  %t995 = inttoptr i64 %t994 to ptr
  call void @intrinsic_println(ptr %t995)
  %t996 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_perturbation.120)
  %t997 = ptrtoint ptr %t996 to i64
  %t998 = inttoptr i64 %t997 to ptr
  call void @intrinsic_println(ptr %t998)
  ret i64 0
}


; String constants
@.str.exp_ns_perturbation.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_perturbation.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_perturbation.2 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_perturbation.3 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_perturbation.4 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_perturbation.5 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_perturbation.6 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_perturbation.7 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_perturbation.8 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_perturbation.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_perturbation.10 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_perturbation.11 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_perturbation.12 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_ns_perturbation.13 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_perturbation.14 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_ns_perturbation.15 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_perturbation.16 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_perturbation.17 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_perturbation.18 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_ns_perturbation.19 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_perturbation.20 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_perturbation.21 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_perturbation.22 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_perturbation.23 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_perturbation.24 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_perturbation.25 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_perturbation.26 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_ns_perturbation.27 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_perturbation.28 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_ns_perturbation.29 = private unnamed_addr constant [45 x i8] c"--- Exp 1: Perturbation Response vs Time ---\00"
@.str.exp_ns_perturbation.30 = private unnamed_addr constant [42 x i8] c"  Evolve Burgers, probe with epsilon kick\00"
@.str.exp_ns_perturbation.31 = private unnamed_addr constant [51 x i8] c"  Stability margin = |S_base - S_kicked| / epsilon\00"
@.str.exp_ns_perturbation.32 = private unnamed_addr constant [39 x i8] c"  HIGH margin = fragile (near blow-up)\00"
@.str.exp_ns_perturbation.33 = private unnamed_addr constant [41 x i8] c"  LOW margin = robust (far from blow-up)\00"
@.str.exp_ns_perturbation.34 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_perturbation.35 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_perturbation.36 = private unnamed_addr constant [8 x i8] c"0.00005\00"
@.str.exp_ns_perturbation.37 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_perturbation.38 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_perturbation.39 = private unnamed_addr constant [63 x i8] c"  Time(steps)  S_base     S_kicked   Margin     Interpretation\00"
@.str.exp_ns_perturbation.40 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_perturbation.41 = private unnamed_addr constant [11 x i8] c"          \00"
@.str.exp_ns_perturbation.42 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_perturbation.43 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_perturbation.44 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_perturbation.45 = private unnamed_addr constant [9 x i8] c"  ROBUST\00"
@.str.exp_ns_perturbation.46 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_ns_perturbation.47 = private unnamed_addr constant [12 x i8] c"  SENSITIVE\00"
@.str.exp_ns_perturbation.48 = private unnamed_addr constant [10 x i8] c"  FRAGILE\00"
@.str.exp_ns_perturbation.49 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_perturbation.50 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_perturbation.51 = private unnamed_addr constant [6 x i8] c"999.0\00"
@.str.exp_ns_perturbation.52 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_perturbation.53 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_perturbation.54 = private unnamed_addr constant [54 x i8] c"--- Exp 2: Critical Epsilon (Distance to Blow-Up) ---\00"
@.str.exp_ns_perturbation.55 = private unnamed_addr constant [47 x i8] c"  Smallest perturbation that crashes S below 0\00"
@.str.exp_ns_perturbation.56 = private unnamed_addr constant [51 x i8] c"  Shrinking critical epsilon = approaching blow-up\00"
@.str.exp_ns_perturbation.57 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_perturbation.58 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_perturbation.59 = private unnamed_addr constant [8 x i8] c"0.00005\00"
@.str.exp_ns_perturbation.60 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_perturbation.61 = private unnamed_addr constant [49 x i8] c"  Time(steps)  Critical Epsilon   Interpretation\00"
@.str.exp_ns_perturbation.62 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_perturbation.63 = private unnamed_addr constant [11 x i8] c"          \00"
@.str.exp_ns_perturbation.64 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_ns_perturbation.65 = private unnamed_addr constant [22 x i8] c"  > 1.0 (very robust)\00"
@.str.exp_ns_perturbation.66 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_perturbation.67 = private unnamed_addr constant [17 x i8] c"          ROBUST\00"
@.str.exp_ns_perturbation.68 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_perturbation.69 = private unnamed_addr constant [20 x i8] c"          SENSITIVE\00"
@.str.exp_ns_perturbation.70 = private unnamed_addr constant [39 x i8] c"          FRAGILE — blow-up imminent\00"
@.str.exp_ns_perturbation.71 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_perturbation.72 = private unnamed_addr constant [34 x i8] c"--- Exp 3: Perturbation Types ---\00"
@.str.exp_ns_perturbation.73 = private unnamed_addr constant [38 x i8] c"  Type A: amplitude kick (+eps to u2)\00"
@.str.exp_ns_perturbation.74 = private unnamed_addr constant [43 x i8] c"  Type B: gradient kick (u2+=eps, u3-=eps)\00"
@.str.exp_ns_perturbation.75 = private unnamed_addr constant [39 x i8] c"  Type C: energy kick (all u *= 1+eps)\00"
@.str.exp_ns_perturbation.76 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_perturbation.77 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_perturbation.78 = private unnamed_addr constant [8 x i8] c"0.00005\00"
@.str.exp_ns_perturbation.79 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_perturbation.80 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_perturbation.81 = private unnamed_addr constant [66 x i8] c"  Time    S_base    S_amp     S_grad    S_energy   Most Sensitive\00"
@.str.exp_ns_perturbation.82 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_perturbation.83 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_perturbation.84 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_perturbation.85 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_perturbation.86 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_perturbation.87 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_perturbation.88 = private unnamed_addr constant [11 x i8] c"  GRADIENT\00"
@.str.exp_ns_perturbation.89 = private unnamed_addr constant [9 x i8] c"  ENERGY\00"
@.str.exp_ns_perturbation.90 = private unnamed_addr constant [12 x i8] c"  AMPLITUDE\00"
@.str.exp_ns_perturbation.91 = private unnamed_addr constant [9 x i8] c"  ENERGY\00"
@.str.exp_ns_perturbation.92 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_perturbation.93 = private unnamed_addr constant [18 x i8] c"  INTERPRETATION:\00"
@.str.exp_ns_perturbation.94 = private unnamed_addr constant [49 x i8] c"  - If GRADIENT most sensitive: shock is forming\00"
@.str.exp_ns_perturbation.95 = private unnamed_addr constant [51 x i8] c"  - If AMPLITUDE most sensitive: point instability\00"
@.str.exp_ns_perturbation.96 = private unnamed_addr constant [53 x i8] c"  - If ENERGY most sensitive: global destabilisation\00"
@.str.exp_ns_perturbation.97 = private unnamed_addr constant [52 x i8] c"  - The most sensitive type tells you the MECHANISM\00"
@.str.exp_ns_perturbation.98 = private unnamed_addr constant [36 x i8] c"    of the approaching instability.\00"
@.str.exp_ns_perturbation.99 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_perturbation.100 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_ns_perturbation.101 = private unnamed_addr constant [45 x i8] c"#  PERTURBATION PROBING:                   #\00"
@.str.exp_ns_perturbation.102 = private unnamed_addr constant [45 x i8] c"#  SKEPTICAL DESIRE FOR FLUID DYNAMICS     #\00"
@.str.exp_ns_perturbation.103 = private unnamed_addr constant [45 x i8] c"#                                          #\00"
@.str.exp_ns_perturbation.104 = private unnamed_addr constant [45 x i8] c"#  Inject dissonance. Measure response.    #\00"
@.str.exp_ns_perturbation.105 = private unnamed_addr constant [45 x i8] c"#  The response IS the stability margin.   #\00"
@.str.exp_ns_perturbation.106 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_ns_perturbation.107 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_perturbation.108 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_ns_perturbation.109 = private unnamed_addr constant [45 x i8] c"#  CONCLUSIONS:                            #\00"
@.str.exp_ns_perturbation.110 = private unnamed_addr constant [45 x i8] c"#  1. Perturbation response measures       #\00"
@.str.exp_ns_perturbation.111 = private unnamed_addr constant [45 x i8] c"#     DISTANCE TO BLOW-UP in real time     #\00"
@.str.exp_ns_perturbation.112 = private unnamed_addr constant [46 x i8] c"#  2. Critical epsilon shrinks as blow-up   #\00"
@.str.exp_ns_perturbation.113 = private unnamed_addr constant [47 x i8] c"#     approaches — quantifiable fragility  #\00"
@.str.exp_ns_perturbation.114 = private unnamed_addr constant [45 x i8] c"#  3. Perturbation TYPE identifies the     #\00"
@.str.exp_ns_perturbation.115 = private unnamed_addr constant [45 x i8] c"#     MECHANISM of instability (shock vs   #\00"
@.str.exp_ns_perturbation.116 = private unnamed_addr constant [45 x i8] c"#     point vs energy)                     #\00"
@.str.exp_ns_perturbation.117 = private unnamed_addr constant [45 x i8] c"#  4. This is the 'skeptical desire' for   #\00"
@.str.exp_ns_perturbation.118 = private unnamed_addr constant [46 x i8] c"#     fluids: deliberate dissonance reveals #\00"
@.str.exp_ns_perturbation.119 = private unnamed_addr constant [45 x i8] c"#     hidden fragility in the flow state   #\00"
@.str.exp_ns_perturbation.120 = private unnamed_addr constant [45 x i8] c"############################################\00"
