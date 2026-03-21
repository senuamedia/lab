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
  %t1 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t9 = load i64, ptr %local.x
  %t10 = load i64, ptr %local.lo
  %t11 = call i64 @"sx_f64_lt"(i64 %t9, i64 %t10)
  %t12 = icmp ne i64 %t11, 0
  br i1 %t12, label %then1, label %else1
then1:
  %t13 = load i64, ptr %local.lo
  ret i64 %t13
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t14 = phi i64 [ 0, %else1_end ]
  %t15 = load i64, ptr %local.x
  %t16 = load i64, ptr %local.hi
  %t17 = call i64 @"sx_f64_gt"(i64 %t15, i64 %t16)
  %t18 = icmp ne i64 %t17, 0
  br i1 %t18, label %then2, label %else2
then2:
  %t19 = load i64, ptr %local.hi
  ret i64 %t19
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t20 = phi i64 [ 0, %else2_end ]
  %t21 = load i64, ptr %local.x
  ret i64 %t21
}

define i64 @"lcg_next"(i64 %state) nounwind {
entry:
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t22 = load i64, ptr %local.state
  %t23 = mul i64 %t22, 1664525
  %t24 = add i64 %t23, 1013904223
  ret i64 %t24
}

define i64 @"lcg_f64"(i64 %state) nounwind {
entry:
  %local.s.25 = alloca i64
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t26 = load i64, ptr %local.state
  store i64 %t26, ptr %local.s.25
  %t27 = load i64, ptr %local.s.25
  %t28 = icmp slt i64 %t27, 0
  %t29 = zext i1 %t28 to i64
  %t30 = icmp ne i64 %t29, 0
  br i1 %t30, label %then3, label %else3
then3:
  %t31 = load i64, ptr %local.s.25
  %t32 = sub i64 0, %t31
  store i64 %t32, ptr %local.s.25
  br label %then3_end
then3_end:
  br label %endif3
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t33 = phi i64 [ 0, %then3_end ], [ 0, %else3_end ]
  %t34 = load i64, ptr %local.s.25
  %t35 = srem i64 %t34, 10000
  %t36 = call i64 @"sx_int_to_f64"(i64 %t35)
  %t37 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.2)
  %t38 = call i64 @"sx_f64_div"(i64 %t36, i64 %t37)
  ret i64 %t38
}

define i64 @"c1_grad"(i64 %x0, i64 %x1, i64 %dim) nounwind {
entry:
  %local.x0 = alloca i64
  store i64 %x0, ptr %local.x0
  %local.x1 = alloca i64
  store i64 %x1, ptr %local.x1
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %t39 = load i64, ptr %local.dim
  %t40 = icmp eq i64 %t39, 0
  %t41 = zext i1 %t40 to i64
  %t42 = icmp ne i64 %t41, 0
  br i1 %t42, label %then4, label %else4
then4:
  %t43 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.3)
  %t44 = load i64, ptr %local.x0
  %t45 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.4)
  %t46 = call i64 @"sx_f64_sub"(i64 %t44, i64 %t45)
  %t47 = call i64 @"sx_f64_mul"(i64 %t43, i64 %t46)
  ret i64 %t47
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t48 = phi i64 [ 0, %else4_end ]
  %t49 = load i64, ptr %local.dim
  %t50 = icmp eq i64 %t49, 1
  %t51 = zext i1 %t50 to i64
  %t52 = icmp ne i64 %t51, 0
  br i1 %t52, label %then5, label %else5
then5:
  %t53 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.5)
  %t54 = load i64, ptr %local.x1
  %t55 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.6)
  %t56 = call i64 @"sx_f64_sub"(i64 %t54, i64 %t55)
  %t57 = call i64 @"sx_f64_mul"(i64 %t53, i64 %t56)
  ret i64 %t57
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t58 = phi i64 [ 0, %else5_end ]
  %t59 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.7)
  ret i64 %t59
}

define i64 @"c2_grad"(i64 %x1, i64 %x2, i64 %dim) nounwind {
entry:
  %local.x1 = alloca i64
  store i64 %x1, ptr %local.x1
  %local.x2 = alloca i64
  store i64 %x2, ptr %local.x2
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %t60 = load i64, ptr %local.dim
  %t61 = icmp eq i64 %t60, 1
  %t62 = zext i1 %t61 to i64
  %t63 = icmp ne i64 %t62, 0
  br i1 %t63, label %then6, label %else6
then6:
  %t64 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.8)
  %t65 = load i64, ptr %local.x1
  %t66 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.9)
  %t67 = call i64 @"sx_f64_sub"(i64 %t65, i64 %t66)
  %t68 = call i64 @"sx_f64_mul"(i64 %t64, i64 %t67)
  ret i64 %t68
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t69 = phi i64 [ 0, %else6_end ]
  %t70 = load i64, ptr %local.dim
  %t71 = icmp eq i64 %t70, 2
  %t72 = zext i1 %t71 to i64
  %t73 = icmp ne i64 %t72, 0
  br i1 %t73, label %then7, label %else7
then7:
  %t74 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.10)
  %t75 = load i64, ptr %local.x2
  %t76 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.11)
  %t77 = call i64 @"sx_f64_sub"(i64 %t75, i64 %t76)
  %t78 = call i64 @"sx_f64_mul"(i64 %t74, i64 %t77)
  ret i64 %t78
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t79 = phi i64 [ 0, %else7_end ]
  %t80 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.12)
  ret i64 %t80
}

define i64 @"c3_grad"(i64 %x2, i64 %x3, i64 %dim) nounwind {
entry:
  %local.x2 = alloca i64
  store i64 %x2, ptr %local.x2
  %local.x3 = alloca i64
  store i64 %x3, ptr %local.x3
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %t81 = load i64, ptr %local.dim
  %t82 = icmp eq i64 %t81, 2
  %t83 = zext i1 %t82 to i64
  %t84 = icmp ne i64 %t83, 0
  br i1 %t84, label %then8, label %else8
then8:
  %t85 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.13)
  %t86 = load i64, ptr %local.x2
  %t87 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.14)
  %t88 = call i64 @"sx_f64_sub"(i64 %t86, i64 %t87)
  %t89 = call i64 @"sx_f64_mul"(i64 %t85, i64 %t88)
  ret i64 %t89
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t90 = phi i64 [ 0, %else8_end ]
  %t91 = load i64, ptr %local.dim
  %t92 = icmp eq i64 %t91, 3
  %t93 = zext i1 %t92 to i64
  %t94 = icmp ne i64 %t93, 0
  br i1 %t94, label %then9, label %else9
then9:
  %t95 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.15)
  %t96 = load i64, ptr %local.x3
  %t97 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.16)
  %t98 = call i64 @"sx_f64_sub"(i64 %t96, i64 %t97)
  %t99 = call i64 @"sx_f64_mul"(i64 %t95, i64 %t98)
  ret i64 %t99
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t100 = phi i64 [ 0, %else9_end ]
  %t101 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.17)
  ret i64 %t101
}

define i64 @"dot4v"(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %b0, i64 %b1, i64 %b2, i64 %b3) nounwind {
entry:
  %local.t0.102 = alloca i64
  %local.t1.103 = alloca i64
  %local.t2.104 = alloca i64
  %local.t3.105 = alloca i64
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %local.b0 = alloca i64
  store i64 %b0, ptr %local.b0
  %local.b1 = alloca i64
  store i64 %b1, ptr %local.b1
  %local.b2 = alloca i64
  store i64 %b2, ptr %local.b2
  %local.b3 = alloca i64
  store i64 %b3, ptr %local.b3
  %t106 = load i64, ptr %local.a0
  %t107 = load i64, ptr %local.b0
  %t108 = call i64 @"sx_f64_mul"(i64 %t106, i64 %t107)
  store i64 %t108, ptr %local.t0.102
  %t109 = load i64, ptr %local.a1
  %t110 = load i64, ptr %local.b1
  %t111 = call i64 @"sx_f64_mul"(i64 %t109, i64 %t110)
  store i64 %t111, ptr %local.t1.103
  %t112 = load i64, ptr %local.a2
  %t113 = load i64, ptr %local.b2
  %t114 = call i64 @"sx_f64_mul"(i64 %t112, i64 %t113)
  store i64 %t114, ptr %local.t2.104
  %t115 = load i64, ptr %local.a3
  %t116 = load i64, ptr %local.b3
  %t117 = call i64 @"sx_f64_mul"(i64 %t115, i64 %t116)
  store i64 %t117, ptr %local.t3.105
  %t118 = load i64, ptr %local.t0.102
  %t119 = load i64, ptr %local.t1.103
  %t120 = call i64 @"sx_f64_add"(i64 %t118, i64 %t119)
  %t121 = load i64, ptr %local.t2.104
  %t122 = call i64 @"sx_f64_add"(i64 %t120, i64 %t121)
  %t123 = load i64, ptr %local.t3.105
  %t124 = call i64 @"sx_f64_add"(i64 %t122, i64 %t123)
  ret i64 %t124
}

define i64 @"cosine4v"(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %b0, i64 %b1, i64 %b2, i64 %b3) nounwind {
entry:
  %local.d.125 = alloca i64
  %local.na.126 = alloca i64
  %local.nb.127 = alloca i64
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %local.b0 = alloca i64
  store i64 %b0, ptr %local.b0
  %local.b1 = alloca i64
  store i64 %b1, ptr %local.b1
  %local.b2 = alloca i64
  store i64 %b2, ptr %local.b2
  %local.b3 = alloca i64
  store i64 %b3, ptr %local.b3
  %t128 = load i64, ptr %local.a0
  %t129 = load i64, ptr %local.a1
  %t130 = load i64, ptr %local.a2
  %t131 = load i64, ptr %local.a3
  %t132 = load i64, ptr %local.b0
  %t133 = load i64, ptr %local.b1
  %t134 = load i64, ptr %local.b2
  %t135 = load i64, ptr %local.b3
  %t136 = call i64 @"dot4v"(i64 %t128, i64 %t129, i64 %t130, i64 %t131, i64 %t132, i64 %t133, i64 %t134, i64 %t135)
  store i64 %t136, ptr %local.d.125
  %t137 = load i64, ptr %local.a0
  %t138 = load i64, ptr %local.a1
  %t139 = load i64, ptr %local.a2
  %t140 = load i64, ptr %local.a3
  %t141 = load i64, ptr %local.a0
  %t142 = load i64, ptr %local.a1
  %t143 = load i64, ptr %local.a2
  %t144 = load i64, ptr %local.a3
  %t145 = call i64 @"dot4v"(i64 %t137, i64 %t138, i64 %t139, i64 %t140, i64 %t141, i64 %t142, i64 %t143, i64 %t144)
  %t146 = call i64 @"sqrt_f64"(i64 %t145)
  store i64 %t146, ptr %local.na.126
  %t147 = load i64, ptr %local.b0
  %t148 = load i64, ptr %local.b1
  %t149 = load i64, ptr %local.b2
  %t150 = load i64, ptr %local.b3
  %t151 = load i64, ptr %local.b0
  %t152 = load i64, ptr %local.b1
  %t153 = load i64, ptr %local.b2
  %t154 = load i64, ptr %local.b3
  %t155 = call i64 @"dot4v"(i64 %t147, i64 %t148, i64 %t149, i64 %t150, i64 %t151, i64 %t152, i64 %t153, i64 %t154)
  %t156 = call i64 @"sqrt_f64"(i64 %t155)
  store i64 %t156, ptr %local.nb.127
  %t157 = load i64, ptr %local.d.125
  %t158 = load i64, ptr %local.na.126
  %t159 = load i64, ptr %local.nb.127
  %t160 = call i64 @"sx_f64_mul"(i64 %t158, i64 %t159)
  %t161 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.18)
  %t162 = call i64 @"sx_f64_add"(i64 %t160, i64 %t161)
  %t163 = call i64 @"sx_f64_div"(i64 %t157, i64 %t162)
  ret i64 %t163
}

define i64 @"test_constraint_graph"() nounwind {
entry:
  %local.g1_0.164 = alloca i64
  %local.g1_1.165 = alloca i64
  %local.g1_2.166 = alloca i64
  %local.g1_3.167 = alloca i64
  %local.g2_0.168 = alloca i64
  %local.g2_1.169 = alloca i64
  %local.g2_2.170 = alloca i64
  %local.g2_3.171 = alloca i64
  %local.g3_0.172 = alloca i64
  %local.g3_1.173 = alloca i64
  %local.g3_2.174 = alloca i64
  %local.g3_3.175 = alloca i64
  %local.cos_12.176 = alloca i64
  %local.cos_13.177 = alloca i64
  %local.cos_23.178 = alloca i64
  %t179 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.19)
  %t180 = ptrtoint ptr %t179 to i64
  %t181 = inttoptr i64 %t180 to ptr
  call void @intrinsic_println(ptr %t181)
  %t182 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.20)
  %t183 = ptrtoint ptr %t182 to i64
  %t184 = inttoptr i64 %t183 to ptr
  call void @intrinsic_println(ptr %t184)
  %t185 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.21)
  %t186 = ptrtoint ptr %t185 to i64
  %t187 = inttoptr i64 %t186 to ptr
  call void @intrinsic_println(ptr %t187)
  %t188 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.22)
  %t189 = ptrtoint ptr %t188 to i64
  %t190 = inttoptr i64 %t189 to ptr
  call void @intrinsic_println(ptr %t190)
  %t191 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.23)
  %t192 = ptrtoint ptr %t191 to i64
  %t193 = inttoptr i64 %t192 to ptr
  call void @intrinsic_println(ptr %t193)
  %t194 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.24)
  %t195 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.25)
  %t196 = call i64 @"c1_grad"(i64 %t194, i64 %t195, i64 0)
  store i64 %t196, ptr %local.g1_0.164
  %t197 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.26)
  %t198 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.27)
  %t199 = call i64 @"c1_grad"(i64 %t197, i64 %t198, i64 1)
  store i64 %t199, ptr %local.g1_1.165
  %t200 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.28)
  store i64 %t200, ptr %local.g1_2.166
  %t201 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.29)
  store i64 %t201, ptr %local.g1_3.167
  %t202 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.30)
  store i64 %t202, ptr %local.g2_0.168
  %t203 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.31)
  %t204 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.32)
  %t205 = call i64 @"c2_grad"(i64 %t203, i64 %t204, i64 1)
  store i64 %t205, ptr %local.g2_1.169
  %t206 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.33)
  %t207 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.34)
  %t208 = call i64 @"c2_grad"(i64 %t206, i64 %t207, i64 2)
  store i64 %t208, ptr %local.g2_2.170
  %t209 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.35)
  store i64 %t209, ptr %local.g2_3.171
  %t210 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.36)
  store i64 %t210, ptr %local.g3_0.172
  %t211 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.37)
  store i64 %t211, ptr %local.g3_1.173
  %t212 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.38)
  %t213 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.39)
  %t214 = call i64 @"c3_grad"(i64 %t212, i64 %t213, i64 2)
  store i64 %t214, ptr %local.g3_2.174
  %t215 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.40)
  %t216 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.41)
  %t217 = call i64 @"c3_grad"(i64 %t215, i64 %t216, i64 3)
  store i64 %t217, ptr %local.g3_3.175
  %t218 = load i64, ptr %local.g1_0.164
  %t219 = load i64, ptr %local.g1_1.165
  %t220 = load i64, ptr %local.g1_2.166
  %t221 = load i64, ptr %local.g1_3.167
  %t222 = load i64, ptr %local.g2_0.168
  %t223 = load i64, ptr %local.g2_1.169
  %t224 = load i64, ptr %local.g2_2.170
  %t225 = load i64, ptr %local.g2_3.171
  %t226 = call i64 @"cosine4v"(i64 %t218, i64 %t219, i64 %t220, i64 %t221, i64 %t222, i64 %t223, i64 %t224, i64 %t225)
  store i64 %t226, ptr %local.cos_12.176
  %t227 = load i64, ptr %local.g1_0.164
  %t228 = load i64, ptr %local.g1_1.165
  %t229 = load i64, ptr %local.g1_2.166
  %t230 = load i64, ptr %local.g1_3.167
  %t231 = load i64, ptr %local.g3_0.172
  %t232 = load i64, ptr %local.g3_1.173
  %t233 = load i64, ptr %local.g3_2.174
  %t234 = load i64, ptr %local.g3_3.175
  %t235 = call i64 @"cosine4v"(i64 %t227, i64 %t228, i64 %t229, i64 %t230, i64 %t231, i64 %t232, i64 %t233, i64 %t234)
  store i64 %t235, ptr %local.cos_13.177
  %t236 = load i64, ptr %local.g2_0.168
  %t237 = load i64, ptr %local.g2_1.169
  %t238 = load i64, ptr %local.g2_2.170
  %t239 = load i64, ptr %local.g2_3.171
  %t240 = load i64, ptr %local.g3_0.172
  %t241 = load i64, ptr %local.g3_1.173
  %t242 = load i64, ptr %local.g3_2.174
  %t243 = load i64, ptr %local.g3_3.175
  %t244 = call i64 @"cosine4v"(i64 %t236, i64 %t237, i64 %t238, i64 %t239, i64 %t240, i64 %t241, i64 %t242, i64 %t243)
  store i64 %t244, ptr %local.cos_23.178
  %t245 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.42)
  %t246 = ptrtoint ptr %t245 to i64
  %t247 = inttoptr i64 %t246 to ptr
  call void @intrinsic_println(ptr %t247)
  %t248 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.43)
  %t249 = ptrtoint ptr %t248 to i64
  %t250 = inttoptr i64 %t249 to ptr
  call void @intrinsic_print(ptr %t250)
  %t251 = load i64, ptr %local.cos_12.176
  %t252 = call i64 @"print_f64"(i64 %t251)
  %t253 = load i64, ptr %local.cos_12.176
  %t254 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.44)
  %t255 = call i64 @"sx_f64_lt"(i64 %t253, i64 %t254)
  %t256 = icmp ne i64 %t255, 0
  br i1 %t256, label %then10, label %else10
then10:
  %t257 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.45)
  %t258 = ptrtoint ptr %t257 to i64
  %t259 = inttoptr i64 %t258 to ptr
  call void @intrinsic_println(ptr %t259)
  br label %then10_end
then10_end:
  br label %endif10
else10:
  %t260 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.46)
  %t261 = ptrtoint ptr %t260 to i64
  %t262 = inttoptr i64 %t261 to ptr
  call void @intrinsic_println(ptr %t262)
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t263 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t264 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.47)
  %t265 = ptrtoint ptr %t264 to i64
  %t266 = inttoptr i64 %t265 to ptr
  call void @intrinsic_print(ptr %t266)
  %t267 = load i64, ptr %local.cos_13.177
  %t268 = call i64 @"print_f64"(i64 %t267)
  %t269 = load i64, ptr %local.cos_13.177
  %t270 = call i64 @"abs_f64"(i64 %t269)
  %t271 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.48)
  %t272 = call i64 @"sx_f64_lt"(i64 %t270, i64 %t271)
  %t273 = icmp ne i64 %t272, 0
  br i1 %t273, label %then11, label %else11
then11:
  %t274 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.49)
  %t275 = ptrtoint ptr %t274 to i64
  %t276 = inttoptr i64 %t275 to ptr
  call void @intrinsic_println(ptr %t276)
  br label %then11_end
then11_end:
  br label %endif11
else11:
  %t277 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.50)
  %t278 = ptrtoint ptr %t277 to i64
  %t279 = inttoptr i64 %t278 to ptr
  call void @intrinsic_println(ptr %t279)
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t280 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t281 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.51)
  %t282 = ptrtoint ptr %t281 to i64
  %t283 = inttoptr i64 %t282 to ptr
  call void @intrinsic_print(ptr %t283)
  %t284 = load i64, ptr %local.cos_23.178
  %t285 = call i64 @"print_f64"(i64 %t284)
  %t286 = load i64, ptr %local.cos_23.178
  %t287 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.52)
  %t288 = call i64 @"sx_f64_lt"(i64 %t286, i64 %t287)
  %t289 = icmp ne i64 %t288, 0
  br i1 %t289, label %then12, label %else12
then12:
  %t290 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.53)
  %t291 = ptrtoint ptr %t290 to i64
  %t292 = inttoptr i64 %t291 to ptr
  call void @intrinsic_println(ptr %t292)
  br label %then12_end
then12_end:
  br label %endif12
else12:
  %t293 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.54)
  %t294 = ptrtoint ptr %t293 to i64
  %t295 = inttoptr i64 %t294 to ptr
  call void @intrinsic_println(ptr %t295)
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t296 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t297 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.55)
  %t298 = ptrtoint ptr %t297 to i64
  %t299 = inttoptr i64 %t298 to ptr
  call void @intrinsic_println(ptr %t299)
  %t300 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.56)
  %t301 = ptrtoint ptr %t300 to i64
  %t302 = inttoptr i64 %t301 to ptr
  call void @intrinsic_println(ptr %t302)
  %t303 = load i64, ptr %local.cos_12.176
  %t304 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.57)
  %t305 = call i64 @"sx_f64_lt"(i64 %t303, i64 %t304)
  %t306 = icmp ne i64 %t305, 0
  br i1 %t306, label %then13, label %else13
then13:
  %t307 = load i64, ptr %local.cos_13.177
  %t308 = call i64 @"abs_f64"(i64 %t307)
  %t309 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.58)
  %t310 = call i64 @"sx_f64_lt"(i64 %t308, i64 %t309)
  %t311 = icmp ne i64 %t310, 0
  br i1 %t311, label %then14, label %else14
then14:
  %t312 = load i64, ptr %local.cos_23.178
  %t313 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.59)
  %t314 = call i64 @"sx_f64_lt"(i64 %t312, i64 %t313)
  %t315 = icmp ne i64 %t314, 0
  br i1 %t315, label %then15, label %else15
then15:
  %t316 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.60)
  %t317 = ptrtoint ptr %t316 to i64
  %t318 = inttoptr i64 %t317 to ptr
  call void @intrinsic_println(ptr %t318)
  br label %then15_end
then15_end:
  br label %endif15
else15:
  %t319 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.61)
  %t320 = ptrtoint ptr %t319 to i64
  %t321 = inttoptr i64 %t320 to ptr
  call void @intrinsic_println(ptr %t321)
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t322 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  br label %then14_end
then14_end:
  br label %endif14
else14:
  %t323 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.62)
  %t324 = ptrtoint ptr %t323 to i64
  %t325 = inttoptr i64 %t324 to ptr
  call void @intrinsic_println(ptr %t325)
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t326 = phi i64 [ %t322, %then14_end ], [ 0, %else14_end ]
  br label %then13_end
then13_end:
  br label %endif13
else13:
  %t327 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.63)
  %t328 = ptrtoint ptr %t327 to i64
  %t329 = inttoptr i64 %t328 to ptr
  call void @intrinsic_println(ptr %t329)
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t330 = phi i64 [ %t326, %then13_end ], [ 0, %else13_end ]
  %t331 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.64)
  %t332 = ptrtoint ptr %t331 to i64
  %t333 = inttoptr i64 %t332 to ptr
  call void @intrinsic_println(ptr %t333)
  ret i64 0
}

define i64 @"easy_loss"(i64 %x0, i64 %x1, i64 %target0, i64 %target1) nounwind {
entry:
  %local.d0.334 = alloca i64
  %local.d1.335 = alloca i64
  %local.x0 = alloca i64
  store i64 %x0, ptr %local.x0
  %local.x1 = alloca i64
  store i64 %x1, ptr %local.x1
  %local.target0 = alloca i64
  store i64 %target0, ptr %local.target0
  %local.target1 = alloca i64
  store i64 %target1, ptr %local.target1
  %t336 = load i64, ptr %local.x0
  %t337 = load i64, ptr %local.target0
  %t338 = call i64 @"sx_f64_sub"(i64 %t336, i64 %t337)
  store i64 %t338, ptr %local.d0.334
  %t339 = load i64, ptr %local.x1
  %t340 = load i64, ptr %local.target1
  %t341 = call i64 @"sx_f64_sub"(i64 %t339, i64 %t340)
  store i64 %t341, ptr %local.d1.335
  %t342 = load i64, ptr %local.d0.334
  %t343 = load i64, ptr %local.d0.334
  %t344 = call i64 @"sx_f64_mul"(i64 %t342, i64 %t343)
  %t345 = load i64, ptr %local.d1.335
  %t346 = load i64, ptr %local.d1.335
  %t347 = call i64 @"sx_f64_mul"(i64 %t345, i64 %t346)
  %t348 = call i64 @"sx_f64_add"(i64 %t344, i64 %t347)
  ret i64 %t348
}

define i64 @"hard_loss"(i64 %x0, i64 %x1, i64 %target0, i64 %target1) nounwind {
entry:
  %local.d0.349 = alloca i64
  %local.d1.350 = alloca i64
  %local.pi.351 = alloca i64
  %local.x0 = alloca i64
  store i64 %x0, ptr %local.x0
  %local.x1 = alloca i64
  store i64 %x1, ptr %local.x1
  %local.target0 = alloca i64
  store i64 %target0, ptr %local.target0
  %local.target1 = alloca i64
  store i64 %target1, ptr %local.target1
  %t352 = load i64, ptr %local.x0
  %t353 = load i64, ptr %local.target0
  %t354 = call i64 @"sx_f64_sub"(i64 %t352, i64 %t353)
  store i64 %t354, ptr %local.d0.349
  %t355 = load i64, ptr %local.x1
  %t356 = load i64, ptr %local.target1
  %t357 = call i64 @"sx_f64_sub"(i64 %t355, i64 %t356)
  store i64 %t357, ptr %local.d1.350
  %t358 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.65)
  store i64 %t358, ptr %local.pi.351
  %t359 = load i64, ptr %local.d0.349
  %t360 = load i64, ptr %local.d0.349
  %t361 = call i64 @"sx_f64_mul"(i64 %t359, i64 %t360)
  %t362 = load i64, ptr %local.d1.350
  %t363 = load i64, ptr %local.d1.350
  %t364 = call i64 @"sx_f64_mul"(i64 %t362, i64 %t363)
  %t365 = call i64 @"sx_f64_add"(i64 %t361, i64 %t364)
  %t366 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.66)
  %t367 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.67)
  %t368 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.68)
  %t369 = load i64, ptr %local.pi.351
  %t370 = call i64 @"sx_f64_mul"(i64 %t368, i64 %t369)
  %t371 = load i64, ptr %local.d0.349
  %t372 = call i64 @"sx_f64_mul"(i64 %t370, i64 %t371)
  %t373 = call i64 @"cos_f64"(i64 %t372)
  %t374 = call i64 @"sx_f64_sub"(i64 %t367, i64 %t373)
  %t375 = call i64 @"sx_f64_mul"(i64 %t366, i64 %t374)
  %t376 = call i64 @"sx_f64_add"(i64 %t365, i64 %t375)
  %t377 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.69)
  %t378 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.70)
  %t379 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.71)
  %t380 = load i64, ptr %local.pi.351
  %t381 = call i64 @"sx_f64_mul"(i64 %t379, i64 %t380)
  %t382 = load i64, ptr %local.d1.350
  %t383 = call i64 @"sx_f64_mul"(i64 %t381, i64 %t382)
  %t384 = call i64 @"cos_f64"(i64 %t383)
  %t385 = call i64 @"sx_f64_sub"(i64 %t378, i64 %t384)
  %t386 = call i64 @"sx_f64_mul"(i64 %t377, i64 %t385)
  %t387 = call i64 @"sx_f64_add"(i64 %t376, i64 %t386)
  ret i64 %t387
}

define i64 @"train_problem"(i64 %hard, i64 %t1_0, i64 %t1_1, i64 %t2_0, i64 %t2_1, i64 %steps, i64 %lr) nounwind {
entry:
  %local.x0.388 = alloca i64
  %local.x1.389 = alloca i64
  %local.step.390 = alloca i64
  %local.g1_0.391 = alloca i64
  %local.g1_1.392 = alloca i64
  %local.g2_0.393 = alloca i64
  %local.g2_1.394 = alloca i64
  %local.pi.395 = alloca i64
  %local.hard = alloca i64
  store i64 %hard, ptr %local.hard
  %local.t1_0 = alloca i64
  store i64 %t1_0, ptr %local.t1_0
  %local.t1_1 = alloca i64
  store i64 %t1_1, ptr %local.t1_1
  %local.t2_0 = alloca i64
  store i64 %t2_0, ptr %local.t2_0
  %local.t2_1 = alloca i64
  store i64 %t2_1, ptr %local.t2_1
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %local.lr = alloca i64
  store i64 %lr, ptr %local.lr
  %t396 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.72)
  store i64 %t396, ptr %local.x0.388
  %t397 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.73)
  store i64 %t397, ptr %local.x1.389
  store i64 0, ptr %local.step.390
  %t398 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.74)
  store i64 %t398, ptr %local.g1_0.391
  %t399 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.75)
  store i64 %t399, ptr %local.g1_1.392
  %t400 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.76)
  store i64 %t400, ptr %local.g2_0.393
  %t401 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.77)
  store i64 %t401, ptr %local.g2_1.394
  %t402 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.78)
  store i64 %t402, ptr %local.pi.395
  br label %loop16
loop16:
  %t403 = load i64, ptr %local.step.390
  %t404 = load i64, ptr %local.steps
  %t405 = icmp slt i64 %t403, %t404
  %t406 = zext i1 %t405 to i64
  %t407 = icmp ne i64 %t406, 0
  br i1 %t407, label %body16, label %endloop16
body16:
  %t408 = load i64, ptr %local.hard
  %t409 = icmp eq i64 %t408, 0
  %t410 = zext i1 %t409 to i64
  %t411 = icmp ne i64 %t410, 0
  br i1 %t411, label %then17, label %else17
then17:
  %t412 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.79)
  %t413 = load i64, ptr %local.x0.388
  %t414 = load i64, ptr %local.t1_0
  %t415 = call i64 @"sx_f64_sub"(i64 %t413, i64 %t414)
  %t416 = call i64 @"sx_f64_mul"(i64 %t412, i64 %t415)
  store i64 %t416, ptr %local.g1_0.391
  %t417 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.80)
  %t418 = load i64, ptr %local.x1.389
  %t419 = load i64, ptr %local.t1_1
  %t420 = call i64 @"sx_f64_sub"(i64 %t418, i64 %t419)
  %t421 = call i64 @"sx_f64_mul"(i64 %t417, i64 %t420)
  store i64 %t421, ptr %local.g1_1.392
  %t422 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.81)
  %t423 = load i64, ptr %local.x0.388
  %t424 = load i64, ptr %local.t2_0
  %t425 = call i64 @"sx_f64_sub"(i64 %t423, i64 %t424)
  %t426 = call i64 @"sx_f64_mul"(i64 %t422, i64 %t425)
  store i64 %t426, ptr %local.g2_0.393
  %t427 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.82)
  %t428 = load i64, ptr %local.x1.389
  %t429 = load i64, ptr %local.t2_1
  %t430 = call i64 @"sx_f64_sub"(i64 %t428, i64 %t429)
  %t431 = call i64 @"sx_f64_mul"(i64 %t427, i64 %t430)
  store i64 %t431, ptr %local.g2_1.394
  br label %then17_end
then17_end:
  br label %endif17
else17:
  %t432 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.83)
  %t433 = load i64, ptr %local.x0.388
  %t434 = load i64, ptr %local.t1_0
  %t435 = call i64 @"sx_f64_sub"(i64 %t433, i64 %t434)
  %t436 = call i64 @"sx_f64_mul"(i64 %t432, i64 %t435)
  %t437 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.84)
  %t438 = load i64, ptr %local.pi.395
  %t439 = call i64 @"sx_f64_mul"(i64 %t437, i64 %t438)
  %t440 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.85)
  %t441 = load i64, ptr %local.pi.395
  %t442 = call i64 @"sx_f64_mul"(i64 %t440, i64 %t441)
  %t443 = load i64, ptr %local.x0.388
  %t444 = load i64, ptr %local.t1_0
  %t445 = call i64 @"sx_f64_sub"(i64 %t443, i64 %t444)
  %t446 = call i64 @"sx_f64_mul"(i64 %t442, i64 %t445)
  %t447 = call i64 @"sin_f64"(i64 %t446)
  %t448 = call i64 @"sx_f64_mul"(i64 %t439, i64 %t447)
  %t449 = call i64 @"sx_f64_add"(i64 %t436, i64 %t448)
  store i64 %t449, ptr %local.g1_0.391
  %t450 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.86)
  %t451 = load i64, ptr %local.x1.389
  %t452 = load i64, ptr %local.t1_1
  %t453 = call i64 @"sx_f64_sub"(i64 %t451, i64 %t452)
  %t454 = call i64 @"sx_f64_mul"(i64 %t450, i64 %t453)
  %t455 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.87)
  %t456 = load i64, ptr %local.pi.395
  %t457 = call i64 @"sx_f64_mul"(i64 %t455, i64 %t456)
  %t458 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.88)
  %t459 = load i64, ptr %local.pi.395
  %t460 = call i64 @"sx_f64_mul"(i64 %t458, i64 %t459)
  %t461 = load i64, ptr %local.x1.389
  %t462 = load i64, ptr %local.t1_1
  %t463 = call i64 @"sx_f64_sub"(i64 %t461, i64 %t462)
  %t464 = call i64 @"sx_f64_mul"(i64 %t460, i64 %t463)
  %t465 = call i64 @"sin_f64"(i64 %t464)
  %t466 = call i64 @"sx_f64_mul"(i64 %t457, i64 %t465)
  %t467 = call i64 @"sx_f64_add"(i64 %t454, i64 %t466)
  store i64 %t467, ptr %local.g1_1.392
  %t468 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.89)
  %t469 = load i64, ptr %local.x0.388
  %t470 = load i64, ptr %local.t2_0
  %t471 = call i64 @"sx_f64_sub"(i64 %t469, i64 %t470)
  %t472 = call i64 @"sx_f64_mul"(i64 %t468, i64 %t471)
  %t473 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.90)
  %t474 = load i64, ptr %local.pi.395
  %t475 = call i64 @"sx_f64_mul"(i64 %t473, i64 %t474)
  %t476 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.91)
  %t477 = load i64, ptr %local.pi.395
  %t478 = call i64 @"sx_f64_mul"(i64 %t476, i64 %t477)
  %t479 = load i64, ptr %local.x0.388
  %t480 = load i64, ptr %local.t2_0
  %t481 = call i64 @"sx_f64_sub"(i64 %t479, i64 %t480)
  %t482 = call i64 @"sx_f64_mul"(i64 %t478, i64 %t481)
  %t483 = call i64 @"sin_f64"(i64 %t482)
  %t484 = call i64 @"sx_f64_mul"(i64 %t475, i64 %t483)
  %t485 = call i64 @"sx_f64_add"(i64 %t472, i64 %t484)
  store i64 %t485, ptr %local.g2_0.393
  %t486 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.92)
  %t487 = load i64, ptr %local.x1.389
  %t488 = load i64, ptr %local.t2_1
  %t489 = call i64 @"sx_f64_sub"(i64 %t487, i64 %t488)
  %t490 = call i64 @"sx_f64_mul"(i64 %t486, i64 %t489)
  %t491 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.93)
  %t492 = load i64, ptr %local.pi.395
  %t493 = call i64 @"sx_f64_mul"(i64 %t491, i64 %t492)
  %t494 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.94)
  %t495 = load i64, ptr %local.pi.395
  %t496 = call i64 @"sx_f64_mul"(i64 %t494, i64 %t495)
  %t497 = load i64, ptr %local.x1.389
  %t498 = load i64, ptr %local.t2_1
  %t499 = call i64 @"sx_f64_sub"(i64 %t497, i64 %t498)
  %t500 = call i64 @"sx_f64_mul"(i64 %t496, i64 %t499)
  %t501 = call i64 @"sin_f64"(i64 %t500)
  %t502 = call i64 @"sx_f64_mul"(i64 %t493, i64 %t501)
  %t503 = call i64 @"sx_f64_add"(i64 %t490, i64 %t502)
  store i64 %t503, ptr %local.g2_1.394
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t504 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t505 = load i64, ptr %local.x0.388
  %t506 = load i64, ptr %local.lr
  %t507 = load i64, ptr %local.g1_0.391
  %t508 = load i64, ptr %local.g2_0.393
  %t509 = call i64 @"sx_f64_add"(i64 %t507, i64 %t508)
  %t510 = call i64 @"sx_f64_mul"(i64 %t506, i64 %t509)
  %t511 = call i64 @"sx_f64_sub"(i64 %t505, i64 %t510)
  store i64 %t511, ptr %local.x0.388
  %t512 = load i64, ptr %local.x1.389
  %t513 = load i64, ptr %local.lr
  %t514 = load i64, ptr %local.g1_1.392
  %t515 = load i64, ptr %local.g2_1.394
  %t516 = call i64 @"sx_f64_add"(i64 %t514, i64 %t515)
  %t517 = call i64 @"sx_f64_mul"(i64 %t513, i64 %t516)
  %t518 = call i64 @"sx_f64_sub"(i64 %t512, i64 %t517)
  store i64 %t518, ptr %local.x1.389
  %t519 = load i64, ptr %local.step.390
  %t520 = add i64 %t519, 1
  store i64 %t520, ptr %local.step.390
  br label %loop16
endloop16:
  %t521 = load i64, ptr %local.hard
  %t522 = icmp eq i64 %t521, 0
  %t523 = zext i1 %t522 to i64
  %t524 = icmp ne i64 %t523, 0
  br i1 %t524, label %then18, label %else18
then18:
  %t525 = load i64, ptr %local.x0.388
  %t526 = load i64, ptr %local.x1.389
  %t527 = load i64, ptr %local.t1_0
  %t528 = load i64, ptr %local.t1_1
  %t529 = call i64 @"easy_loss"(i64 %t525, i64 %t526, i64 %t527, i64 %t528)
  %t530 = load i64, ptr %local.x0.388
  %t531 = load i64, ptr %local.x1.389
  %t532 = load i64, ptr %local.t2_0
  %t533 = load i64, ptr %local.t2_1
  %t534 = call i64 @"easy_loss"(i64 %t530, i64 %t531, i64 %t532, i64 %t533)
  %t535 = call i64 @"sx_f64_add"(i64 %t529, i64 %t534)
  br label %then18_end
then18_end:
  br label %endif18
else18:
  %t536 = load i64, ptr %local.x0.388
  %t537 = load i64, ptr %local.x1.389
  %t538 = load i64, ptr %local.t1_0
  %t539 = load i64, ptr %local.t1_1
  %t540 = call i64 @"hard_loss"(i64 %t536, i64 %t537, i64 %t538, i64 %t539)
  %t541 = load i64, ptr %local.x0.388
  %t542 = load i64, ptr %local.x1.389
  %t543 = load i64, ptr %local.t2_0
  %t544 = load i64, ptr %local.t2_1
  %t545 = call i64 @"hard_loss"(i64 %t541, i64 %t542, i64 %t543, i64 %t544)
  %t546 = call i64 @"sx_f64_add"(i64 %t540, i64 %t545)
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t547 = phi i64 [ %t535, %then18_end ], [ %t546, %else18_end ]
  ret i64 %t547
}

define i64 @"test_hardness"() nounwind {
entry:
  %local.easy_no_opp.548 = alloca i64
  %local.easy_with_opp.549 = alloca i64
  %local.hard_no_opp.550 = alloca i64
  %local.hard_with_opp.551 = alloca i64
  %local.easy_with_skep.552 = alloca i64
  %local.hard_with_skep.553 = alloca i64
  %local.x0.554 = alloca i64
  %local.x1.555 = alloca i64
  %local.step.556 = alloca i64
  %local.pi.557 = alloca i64
  %local.g1_0.558 = alloca i64
  %local.g1_1.559 = alloca i64
  %local.g2_0.560 = alloca i64
  %local.g2_1.561 = alloca i64
  %local.g3_0.562 = alloca i64
  %local.g3_1.563 = alloca i64
  %local.hard_skep_loss.564 = alloca i64
  %t565 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.95)
  %t566 = ptrtoint ptr %t565 to i64
  %t567 = inttoptr i64 %t566 to ptr
  call void @intrinsic_println(ptr %t567)
  %t568 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.96)
  %t569 = ptrtoint ptr %t568 to i64
  %t570 = inttoptr i64 %t569 to ptr
  call void @intrinsic_println(ptr %t570)
  %t571 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.97)
  %t572 = ptrtoint ptr %t571 to i64
  %t573 = inttoptr i64 %t572 to ptr
  call void @intrinsic_println(ptr %t573)
  %t574 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.98)
  %t575 = ptrtoint ptr %t574 to i64
  %t576 = inttoptr i64 %t575 to ptr
  call void @intrinsic_println(ptr %t576)
  %t577 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.99)
  %t578 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.100)
  %t579 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.101)
  %t580 = xor i64 %t579, -9223372036854775808
  %t581 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.102)
  %t582 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.103)
  %t583 = call i64 @"train_problem"(i64 0, i64 %t577, i64 %t578, i64 %t580, i64 %t581, i64 500, i64 %t582)
  store i64 %t583, ptr %local.easy_no_opp.548
  %t584 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.104)
  %t585 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.105)
  %t586 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.106)
  %t587 = xor i64 %t586, -9223372036854775808
  %t588 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.107)
  %t589 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.108)
  %t590 = call i64 @"train_problem"(i64 0, i64 %t584, i64 %t585, i64 %t587, i64 %t588, i64 500, i64 %t589)
  store i64 %t590, ptr %local.easy_with_opp.549
  %t591 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.109)
  %t592 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.110)
  %t593 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.111)
  %t594 = xor i64 %t593, -9223372036854775808
  %t595 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.112)
  %t596 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.113)
  %t597 = call i64 @"train_problem"(i64 1, i64 %t591, i64 %t592, i64 %t594, i64 %t595, i64 500, i64 %t596)
  store i64 %t597, ptr %local.hard_no_opp.550
  %t598 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.114)
  %t599 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.115)
  %t600 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.116)
  %t601 = xor i64 %t600, -9223372036854775808
  %t602 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.117)
  %t603 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.118)
  %t604 = call i64 @"train_problem"(i64 1, i64 %t598, i64 %t599, i64 %t601, i64 %t602, i64 500, i64 %t603)
  store i64 %t604, ptr %local.hard_with_opp.551
  %t605 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.119)
  %t606 = ptrtoint ptr %t605 to i64
  %t607 = inttoptr i64 %t606 to ptr
  call void @intrinsic_print(ptr %t607)
  %t608 = load i64, ptr %local.easy_no_opp.548
  %t609 = call i64 @"print_f64"(i64 %t608)
  %t610 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.120)
  %t611 = ptrtoint ptr %t610 to i64
  %t612 = inttoptr i64 %t611 to ptr
  call void @intrinsic_println(ptr %t612)
  %t613 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.121)
  %t614 = ptrtoint ptr %t613 to i64
  %t615 = inttoptr i64 %t614 to ptr
  call void @intrinsic_print(ptr %t615)
  %t616 = load i64, ptr %local.hard_no_opp.550
  %t617 = call i64 @"print_f64"(i64 %t616)
  %t618 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.122)
  %t619 = ptrtoint ptr %t618 to i64
  %t620 = inttoptr i64 %t619 to ptr
  call void @intrinsic_println(ptr %t620)
  %t621 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.123)
  %t622 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.124)
  %t623 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.125)
  %t624 = xor i64 %t623, -9223372036854775808
  %t625 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.126)
  %t626 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.127)
  %t627 = call i64 @"train_problem"(i64 0, i64 %t621, i64 %t622, i64 %t624, i64 %t625, i64 500, i64 %t626)
  store i64 %t627, ptr %local.easy_with_skep.552
  %t628 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.128)
  %t629 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.129)
  %t630 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.130)
  %t631 = xor i64 %t630, -9223372036854775808
  %t632 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.131)
  %t633 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.132)
  %t634 = call i64 @"train_problem"(i64 1, i64 %t628, i64 %t629, i64 %t631, i64 %t632, i64 500, i64 %t633)
  store i64 %t634, ptr %local.hard_with_skep.553
  %t635 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.133)
  %t636 = ptrtoint ptr %t635 to i64
  %t637 = inttoptr i64 %t636 to ptr
  call void @intrinsic_println(ptr %t637)
  %t638 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.134)
  %t639 = ptrtoint ptr %t638 to i64
  %t640 = inttoptr i64 %t639 to ptr
  call void @intrinsic_println(ptr %t640)
  %t641 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.135)
  %t642 = ptrtoint ptr %t641 to i64
  %t643 = inttoptr i64 %t642 to ptr
  call void @intrinsic_println(ptr %t643)
  %t644 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.136)
  %t645 = ptrtoint ptr %t644 to i64
  %t646 = inttoptr i64 %t645 to ptr
  call void @intrinsic_println(ptr %t646)
  %t647 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.137)
  %t648 = ptrtoint ptr %t647 to i64
  %t649 = inttoptr i64 %t648 to ptr
  call void @intrinsic_println(ptr %t649)
  %t650 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.138)
  store i64 %t650, ptr %local.x0.554
  %t651 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.139)
  store i64 %t651, ptr %local.x1.555
  store i64 0, ptr %local.step.556
  %t652 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.140)
  store i64 %t652, ptr %local.pi.557
  br label %loop19
loop19:
  %t653 = load i64, ptr %local.step.556
  %t654 = icmp slt i64 %t653, 500
  %t655 = zext i1 %t654 to i64
  %t656 = icmp ne i64 %t655, 0
  br i1 %t656, label %body19, label %endloop19
body19:
  %t657 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.141)
  %t658 = load i64, ptr %local.x0.554
  %t659 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.142)
  %t660 = call i64 @"sx_f64_sub"(i64 %t658, i64 %t659)
  %t661 = call i64 @"sx_f64_mul"(i64 %t657, i64 %t660)
  %t662 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.143)
  %t663 = load i64, ptr %local.pi.557
  %t664 = call i64 @"sx_f64_mul"(i64 %t662, i64 %t663)
  %t665 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.144)
  %t666 = load i64, ptr %local.pi.557
  %t667 = call i64 @"sx_f64_mul"(i64 %t665, i64 %t666)
  %t668 = load i64, ptr %local.x0.554
  %t669 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.145)
  %t670 = call i64 @"sx_f64_sub"(i64 %t668, i64 %t669)
  %t671 = call i64 @"sx_f64_mul"(i64 %t667, i64 %t670)
  %t672 = call i64 @"sin_f64"(i64 %t671)
  %t673 = call i64 @"sx_f64_mul"(i64 %t664, i64 %t672)
  %t674 = call i64 @"sx_f64_add"(i64 %t661, i64 %t673)
  store i64 %t674, ptr %local.g1_0.558
  %t675 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.146)
  %t676 = load i64, ptr %local.x1.555
  %t677 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.147)
  %t678 = call i64 @"sx_f64_sub"(i64 %t676, i64 %t677)
  %t679 = call i64 @"sx_f64_mul"(i64 %t675, i64 %t678)
  %t680 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.148)
  %t681 = load i64, ptr %local.pi.557
  %t682 = call i64 @"sx_f64_mul"(i64 %t680, i64 %t681)
  %t683 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.149)
  %t684 = load i64, ptr %local.pi.557
  %t685 = call i64 @"sx_f64_mul"(i64 %t683, i64 %t684)
  %t686 = load i64, ptr %local.x1.555
  %t687 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.150)
  %t688 = call i64 @"sx_f64_sub"(i64 %t686, i64 %t687)
  %t689 = call i64 @"sx_f64_mul"(i64 %t685, i64 %t688)
  %t690 = call i64 @"sin_f64"(i64 %t689)
  %t691 = call i64 @"sx_f64_mul"(i64 %t682, i64 %t690)
  %t692 = call i64 @"sx_f64_add"(i64 %t679, i64 %t691)
  store i64 %t692, ptr %local.g1_1.559
  %t693 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.151)
  %t694 = load i64, ptr %local.x0.554
  %t695 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.152)
  %t696 = call i64 @"sx_f64_add"(i64 %t694, i64 %t695)
  %t697 = call i64 @"sx_f64_mul"(i64 %t693, i64 %t696)
  %t698 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.153)
  %t699 = load i64, ptr %local.pi.557
  %t700 = call i64 @"sx_f64_mul"(i64 %t698, i64 %t699)
  %t701 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.154)
  %t702 = load i64, ptr %local.pi.557
  %t703 = call i64 @"sx_f64_mul"(i64 %t701, i64 %t702)
  %t704 = load i64, ptr %local.x0.554
  %t705 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.155)
  %t706 = call i64 @"sx_f64_add"(i64 %t704, i64 %t705)
  %t707 = call i64 @"sx_f64_mul"(i64 %t703, i64 %t706)
  %t708 = call i64 @"sin_f64"(i64 %t707)
  %t709 = call i64 @"sx_f64_mul"(i64 %t700, i64 %t708)
  %t710 = call i64 @"sx_f64_add"(i64 %t697, i64 %t709)
  store i64 %t710, ptr %local.g2_0.560
  %t711 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.156)
  %t712 = load i64, ptr %local.x1.555
  %t713 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.157)
  %t714 = call i64 @"sx_f64_sub"(i64 %t712, i64 %t713)
  %t715 = call i64 @"sx_f64_mul"(i64 %t711, i64 %t714)
  %t716 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.158)
  %t717 = load i64, ptr %local.pi.557
  %t718 = call i64 @"sx_f64_mul"(i64 %t716, i64 %t717)
  %t719 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.159)
  %t720 = load i64, ptr %local.pi.557
  %t721 = call i64 @"sx_f64_mul"(i64 %t719, i64 %t720)
  %t722 = load i64, ptr %local.x1.555
  %t723 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.160)
  %t724 = call i64 @"sx_f64_sub"(i64 %t722, i64 %t723)
  %t725 = call i64 @"sx_f64_mul"(i64 %t721, i64 %t724)
  %t726 = call i64 @"sin_f64"(i64 %t725)
  %t727 = call i64 @"sx_f64_mul"(i64 %t718, i64 %t726)
  %t728 = call i64 @"sx_f64_add"(i64 %t715, i64 %t727)
  store i64 %t728, ptr %local.g2_1.561
  %t729 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.161)
  %t730 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.162)
  %t731 = call i64 @"sx_f64_mul"(i64 %t729, i64 %t730)
  %t732 = load i64, ptr %local.x0.554
  %t733 = call i64 @"sx_f64_mul"(i64 %t731, i64 %t732)
  store i64 %t733, ptr %local.g3_0.562
  %t734 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.163)
  %t735 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.164)
  %t736 = call i64 @"sx_f64_mul"(i64 %t734, i64 %t735)
  %t737 = load i64, ptr %local.x1.555
  %t738 = call i64 @"sx_f64_mul"(i64 %t736, i64 %t737)
  store i64 %t738, ptr %local.g3_1.563
  %t739 = load i64, ptr %local.x0.554
  %t740 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.165)
  %t741 = load i64, ptr %local.g1_0.558
  %t742 = load i64, ptr %local.g2_0.560
  %t743 = call i64 @"sx_f64_add"(i64 %t741, i64 %t742)
  %t744 = load i64, ptr %local.g3_0.562
  %t745 = call i64 @"sx_f64_add"(i64 %t743, i64 %t744)
  %t746 = call i64 @"sx_f64_mul"(i64 %t740, i64 %t745)
  %t747 = call i64 @"sx_f64_sub"(i64 %t739, i64 %t746)
  store i64 %t747, ptr %local.x0.554
  %t748 = load i64, ptr %local.x1.555
  %t749 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.166)
  %t750 = load i64, ptr %local.g1_1.559
  %t751 = load i64, ptr %local.g2_1.561
  %t752 = call i64 @"sx_f64_add"(i64 %t750, i64 %t751)
  %t753 = load i64, ptr %local.g3_1.563
  %t754 = call i64 @"sx_f64_add"(i64 %t752, i64 %t753)
  %t755 = call i64 @"sx_f64_mul"(i64 %t749, i64 %t754)
  %t756 = call i64 @"sx_f64_sub"(i64 %t748, i64 %t755)
  store i64 %t756, ptr %local.x1.555
  %t757 = load i64, ptr %local.step.556
  %t758 = add i64 %t757, 1
  store i64 %t758, ptr %local.step.556
  br label %loop19
endloop19:
  %t759 = load i64, ptr %local.x0.554
  %t760 = load i64, ptr %local.x1.555
  %t761 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.167)
  %t762 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.168)
  %t763 = call i64 @"hard_loss"(i64 %t759, i64 %t760, i64 %t761, i64 %t762)
  %t764 = load i64, ptr %local.x0.554
  %t765 = load i64, ptr %local.x1.555
  %t766 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.169)
  %t767 = xor i64 %t766, -9223372036854775808
  %t768 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.170)
  %t769 = call i64 @"hard_loss"(i64 %t764, i64 %t765, i64 %t767, i64 %t768)
  %t770 = call i64 @"sx_f64_add"(i64 %t763, i64 %t769)
  store i64 %t770, ptr %local.hard_skep_loss.564
  %t771 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.171)
  %t772 = ptrtoint ptr %t771 to i64
  %t773 = inttoptr i64 %t772 to ptr
  call void @intrinsic_print(ptr %t773)
  %t774 = load i64, ptr %local.hard_no_opp.550
  %t775 = call i64 @"print_f64"(i64 %t774)
  %t776 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.172)
  %t777 = ptrtoint ptr %t776 to i64
  %t778 = inttoptr i64 %t777 to ptr
  call void @intrinsic_println(ptr %t778)
  %t779 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.173)
  %t780 = ptrtoint ptr %t779 to i64
  %t781 = inttoptr i64 %t780 to ptr
  call void @intrinsic_print(ptr %t781)
  %t782 = load i64, ptr %local.hard_skep_loss.564
  %t783 = call i64 @"print_f64"(i64 %t782)
  %t784 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.174)
  %t785 = ptrtoint ptr %t784 to i64
  %t786 = inttoptr i64 %t785 to ptr
  call void @intrinsic_println(ptr %t786)
  %t787 = load i64, ptr %local.hard_skep_loss.564
  %t788 = load i64, ptr %local.hard_no_opp.550
  %t789 = call i64 @"sx_f64_lt"(i64 %t787, i64 %t788)
  %t790 = icmp ne i64 %t789, 0
  br i1 %t790, label %then20, label %else20
then20:
  %t791 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.175)
  %t792 = ptrtoint ptr %t791 to i64
  %t793 = inttoptr i64 %t792 to ptr
  call void @intrinsic_println(ptr %t793)
  br label %then20_end
then20_end:
  br label %endif20
else20:
  %t794 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.176)
  %t795 = ptrtoint ptr %t794 to i64
  %t796 = inttoptr i64 %t795 to ptr
  call void @intrinsic_println(ptr %t796)
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t797 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  %t798 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.177)
  %t799 = ptrtoint ptr %t798 to i64
  %t800 = inttoptr i64 %t799 to ptr
  call void @intrinsic_println(ptr %t800)
  ret i64 0
}

define i64 @"train_with_constraints"(i64 %n_constraints, i64 %seed) nounwind {
entry:
  %local.x0.801 = alloca i64
  %local.x1.802 = alloca i64
  %local.x2.803 = alloca i64
  %local.x3.804 = alloca i64
  %local.step.805 = alloca i64
  %local.rng.806 = alloca i64
  %local.total_grad_0.807 = alloca i64
  %local.total_grad_1.808 = alloca i64
  %local.total_grad_2.809 = alloca i64
  %local.total_grad_3.810 = alloca i64
  %local.c.811 = alloca i64
  %local.crng.812 = alloca i64
  %local.target.813 = alloca i64
  %local.dim.814 = alloca i64
  %local.adim.815 = alloca i64
  %local.nc.816 = alloca i64
  %local.total_loss.817 = alloca i64
  %local.c2.818 = alloca i64
  %local.crng2.819 = alloca i64
  %local.target.820 = alloca i64
  %local.dim.821 = alloca i64
  %local.adim.822 = alloca i64
  %local.val.823 = alloca i64
  %local.d.824 = alloca i64
  %local.n_constraints = alloca i64
  store i64 %n_constraints, ptr %local.n_constraints
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t825 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.178)
  store i64 %t825, ptr %local.x0.801
  %t826 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.179)
  store i64 %t826, ptr %local.x1.802
  %t827 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.180)
  store i64 %t827, ptr %local.x2.803
  %t828 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.181)
  store i64 %t828, ptr %local.x3.804
  store i64 0, ptr %local.step.805
  %t829 = load i64, ptr %local.seed
  store i64 %t829, ptr %local.rng.806
  %t830 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.182)
  store i64 %t830, ptr %local.total_grad_0.807
  %t831 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.183)
  store i64 %t831, ptr %local.total_grad_1.808
  %t832 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.184)
  store i64 %t832, ptr %local.total_grad_2.809
  %t833 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.185)
  store i64 %t833, ptr %local.total_grad_3.810
  br label %loop21
loop21:
  %t834 = load i64, ptr %local.step.805
  %t835 = icmp slt i64 %t834, 300
  %t836 = zext i1 %t835 to i64
  %t837 = icmp ne i64 %t836, 0
  br i1 %t837, label %body21, label %endloop21
body21:
  %t838 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.186)
  store i64 %t838, ptr %local.total_grad_0.807
  %t839 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.187)
  store i64 %t839, ptr %local.total_grad_1.808
  %t840 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.188)
  store i64 %t840, ptr %local.total_grad_2.809
  %t841 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.189)
  store i64 %t841, ptr %local.total_grad_3.810
  store i64 0, ptr %local.c.811
  %t842 = load i64, ptr %local.seed
  store i64 %t842, ptr %local.crng.812
  br label %loop22
loop22:
  %t843 = load i64, ptr %local.c.811
  %t844 = load i64, ptr %local.n_constraints
  %t845 = icmp slt i64 %t843, %t844
  %t846 = zext i1 %t845 to i64
  %t847 = icmp ne i64 %t846, 0
  br i1 %t847, label %body22, label %endloop22
body22:
  %t848 = load i64, ptr %local.crng.812
  %t849 = call i64 @"lcg_next"(i64 %t848)
  store i64 %t849, ptr %local.crng.812
  %t850 = load i64, ptr %local.crng.812
  %t851 = call i64 @"lcg_f64"(i64 %t850)
  %t852 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.190)
  %t853 = call i64 @"sx_f64_sub"(i64 %t851, i64 %t852)
  %t854 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.191)
  %t855 = call i64 @"sx_f64_mul"(i64 %t853, i64 %t854)
  store i64 %t855, ptr %local.target.813
  %t856 = load i64, ptr %local.crng.812
  %t857 = call i64 @"lcg_next"(i64 %t856)
  store i64 %t857, ptr %local.crng.812
  %t858 = load i64, ptr %local.crng.812
  %t859 = srem i64 %t858, 4
  store i64 %t859, ptr %local.dim.814
  %t860 = load i64, ptr %local.dim.814
  store i64 %t860, ptr %local.adim.815
  %t861 = load i64, ptr %local.adim.815
  %t862 = icmp slt i64 %t861, 0
  %t863 = zext i1 %t862 to i64
  %t864 = icmp ne i64 %t863, 0
  br i1 %t864, label %then23, label %else23
then23:
  %t865 = load i64, ptr %local.adim.815
  %t866 = sub i64 0, %t865
  store i64 %t866, ptr %local.adim.815
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t867 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t868 = load i64, ptr %local.adim.815
  %t869 = icmp eq i64 %t868, 0
  %t870 = zext i1 %t869 to i64
  %t871 = icmp ne i64 %t870, 0
  br i1 %t871, label %then24, label %else24
then24:
  %t872 = load i64, ptr %local.total_grad_0.807
  %t873 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.192)
  %t874 = load i64, ptr %local.x0.801
  %t875 = load i64, ptr %local.target.813
  %t876 = call i64 @"sx_f64_sub"(i64 %t874, i64 %t875)
  %t877 = call i64 @"sx_f64_mul"(i64 %t873, i64 %t876)
  %t878 = call i64 @"sx_f64_add"(i64 %t872, i64 %t877)
  store i64 %t878, ptr %local.total_grad_0.807
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t879 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t880 = load i64, ptr %local.adim.815
  %t881 = icmp eq i64 %t880, 1
  %t882 = zext i1 %t881 to i64
  %t883 = icmp ne i64 %t882, 0
  br i1 %t883, label %then25, label %else25
then25:
  %t884 = load i64, ptr %local.total_grad_1.808
  %t885 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.193)
  %t886 = load i64, ptr %local.x1.802
  %t887 = load i64, ptr %local.target.813
  %t888 = call i64 @"sx_f64_sub"(i64 %t886, i64 %t887)
  %t889 = call i64 @"sx_f64_mul"(i64 %t885, i64 %t888)
  %t890 = call i64 @"sx_f64_add"(i64 %t884, i64 %t889)
  store i64 %t890, ptr %local.total_grad_1.808
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t891 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t892 = load i64, ptr %local.adim.815
  %t893 = icmp eq i64 %t892, 2
  %t894 = zext i1 %t893 to i64
  %t895 = icmp ne i64 %t894, 0
  br i1 %t895, label %then26, label %else26
then26:
  %t896 = load i64, ptr %local.total_grad_2.809
  %t897 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.194)
  %t898 = load i64, ptr %local.x2.803
  %t899 = load i64, ptr %local.target.813
  %t900 = call i64 @"sx_f64_sub"(i64 %t898, i64 %t899)
  %t901 = call i64 @"sx_f64_mul"(i64 %t897, i64 %t900)
  %t902 = call i64 @"sx_f64_add"(i64 %t896, i64 %t901)
  store i64 %t902, ptr %local.total_grad_2.809
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t903 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t904 = load i64, ptr %local.adim.815
  %t905 = icmp eq i64 %t904, 3
  %t906 = zext i1 %t905 to i64
  %t907 = icmp ne i64 %t906, 0
  br i1 %t907, label %then27, label %else27
then27:
  %t908 = load i64, ptr %local.total_grad_3.810
  %t909 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.195)
  %t910 = load i64, ptr %local.x3.804
  %t911 = load i64, ptr %local.target.813
  %t912 = call i64 @"sx_f64_sub"(i64 %t910, i64 %t911)
  %t913 = call i64 @"sx_f64_mul"(i64 %t909, i64 %t912)
  %t914 = call i64 @"sx_f64_add"(i64 %t908, i64 %t913)
  store i64 %t914, ptr %local.total_grad_3.810
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t915 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t916 = load i64, ptr %local.c.811
  %t917 = add i64 %t916, 1
  store i64 %t917, ptr %local.c.811
  br label %loop22
endloop22:
  %t918 = load i64, ptr %local.n_constraints
  %t919 = call i64 @"sx_int_to_f64"(i64 %t918)
  store i64 %t919, ptr %local.nc.816
  %t920 = load i64, ptr %local.x0.801
  %t921 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.196)
  %t922 = load i64, ptr %local.total_grad_0.807
  %t923 = call i64 @"sx_f64_mul"(i64 %t921, i64 %t922)
  %t924 = load i64, ptr %local.nc.816
  %t925 = call i64 @"sx_f64_div"(i64 %t923, i64 %t924)
  %t926 = call i64 @"sx_f64_sub"(i64 %t920, i64 %t925)
  store i64 %t926, ptr %local.x0.801
  %t927 = load i64, ptr %local.x1.802
  %t928 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.197)
  %t929 = load i64, ptr %local.total_grad_1.808
  %t930 = call i64 @"sx_f64_mul"(i64 %t928, i64 %t929)
  %t931 = load i64, ptr %local.nc.816
  %t932 = call i64 @"sx_f64_div"(i64 %t930, i64 %t931)
  %t933 = call i64 @"sx_f64_sub"(i64 %t927, i64 %t932)
  store i64 %t933, ptr %local.x1.802
  %t934 = load i64, ptr %local.x2.803
  %t935 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.198)
  %t936 = load i64, ptr %local.total_grad_2.809
  %t937 = call i64 @"sx_f64_mul"(i64 %t935, i64 %t936)
  %t938 = load i64, ptr %local.nc.816
  %t939 = call i64 @"sx_f64_div"(i64 %t937, i64 %t938)
  %t940 = call i64 @"sx_f64_sub"(i64 %t934, i64 %t939)
  store i64 %t940, ptr %local.x2.803
  %t941 = load i64, ptr %local.x3.804
  %t942 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.199)
  %t943 = load i64, ptr %local.total_grad_3.810
  %t944 = call i64 @"sx_f64_mul"(i64 %t942, i64 %t943)
  %t945 = load i64, ptr %local.nc.816
  %t946 = call i64 @"sx_f64_div"(i64 %t944, i64 %t945)
  %t947 = call i64 @"sx_f64_sub"(i64 %t941, i64 %t946)
  store i64 %t947, ptr %local.x3.804
  %t948 = load i64, ptr %local.step.805
  %t949 = add i64 %t948, 1
  store i64 %t949, ptr %local.step.805
  br label %loop21
endloop21:
  %t950 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.200)
  store i64 %t950, ptr %local.total_loss.817
  store i64 0, ptr %local.c2.818
  %t951 = load i64, ptr %local.seed
  store i64 %t951, ptr %local.crng2.819
  br label %loop28
loop28:
  %t952 = load i64, ptr %local.c2.818
  %t953 = load i64, ptr %local.n_constraints
  %t954 = icmp slt i64 %t952, %t953
  %t955 = zext i1 %t954 to i64
  %t956 = icmp ne i64 %t955, 0
  br i1 %t956, label %body28, label %endloop28
body28:
  %t957 = load i64, ptr %local.crng2.819
  %t958 = call i64 @"lcg_next"(i64 %t957)
  store i64 %t958, ptr %local.crng2.819
  %t959 = load i64, ptr %local.crng2.819
  %t960 = call i64 @"lcg_f64"(i64 %t959)
  %t961 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.201)
  %t962 = call i64 @"sx_f64_sub"(i64 %t960, i64 %t961)
  %t963 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.202)
  %t964 = call i64 @"sx_f64_mul"(i64 %t962, i64 %t963)
  store i64 %t964, ptr %local.target.820
  %t965 = load i64, ptr %local.crng2.819
  %t966 = call i64 @"lcg_next"(i64 %t965)
  store i64 %t966, ptr %local.crng2.819
  %t967 = load i64, ptr %local.crng2.819
  %t968 = srem i64 %t967, 4
  store i64 %t968, ptr %local.dim.821
  %t969 = load i64, ptr %local.dim.821
  store i64 %t969, ptr %local.adim.822
  %t970 = load i64, ptr %local.adim.822
  %t971 = icmp slt i64 %t970, 0
  %t972 = zext i1 %t971 to i64
  %t973 = icmp ne i64 %t972, 0
  br i1 %t973, label %then29, label %else29
then29:
  %t974 = load i64, ptr %local.adim.822
  %t975 = sub i64 0, %t974
  store i64 %t975, ptr %local.adim.822
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t976 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t977 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.203)
  store i64 %t977, ptr %local.val.823
  %t978 = load i64, ptr %local.adim.822
  %t979 = icmp eq i64 %t978, 0
  %t980 = zext i1 %t979 to i64
  %t981 = icmp ne i64 %t980, 0
  br i1 %t981, label %then30, label %else30
then30:
  %t982 = load i64, ptr %local.x0.801
  store i64 %t982, ptr %local.val.823
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t983 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t984 = load i64, ptr %local.adim.822
  %t985 = icmp eq i64 %t984, 1
  %t986 = zext i1 %t985 to i64
  %t987 = icmp ne i64 %t986, 0
  br i1 %t987, label %then31, label %else31
then31:
  %t988 = load i64, ptr %local.x1.802
  store i64 %t988, ptr %local.val.823
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t989 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t990 = load i64, ptr %local.adim.822
  %t991 = icmp eq i64 %t990, 2
  %t992 = zext i1 %t991 to i64
  %t993 = icmp ne i64 %t992, 0
  br i1 %t993, label %then32, label %else32
then32:
  %t994 = load i64, ptr %local.x2.803
  store i64 %t994, ptr %local.val.823
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t995 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t996 = load i64, ptr %local.adim.822
  %t997 = icmp eq i64 %t996, 3
  %t998 = zext i1 %t997 to i64
  %t999 = icmp ne i64 %t998, 0
  br i1 %t999, label %then33, label %else33
then33:
  %t1000 = load i64, ptr %local.x3.804
  store i64 %t1000, ptr %local.val.823
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t1001 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  %t1002 = load i64, ptr %local.val.823
  %t1003 = load i64, ptr %local.target.820
  %t1004 = call i64 @"sx_f64_sub"(i64 %t1002, i64 %t1003)
  store i64 %t1004, ptr %local.d.824
  %t1005 = load i64, ptr %local.total_loss.817
  %t1006 = load i64, ptr %local.d.824
  %t1007 = load i64, ptr %local.d.824
  %t1008 = call i64 @"sx_f64_mul"(i64 %t1006, i64 %t1007)
  %t1009 = call i64 @"sx_f64_add"(i64 %t1005, i64 %t1008)
  store i64 %t1009, ptr %local.total_loss.817
  %t1010 = load i64, ptr %local.c2.818
  %t1011 = add i64 %t1010, 1
  store i64 %t1011, ptr %local.c2.818
  br label %loop28
endloop28:
  %t1012 = load i64, ptr %local.total_loss.817
  %t1013 = load i64, ptr %local.n_constraints
  %t1014 = call i64 @"sx_int_to_f64"(i64 %t1013)
  %t1015 = call i64 @"sx_f64_div"(i64 %t1012, i64 %t1014)
  ret i64 %t1015
}

define i64 @"test_phase_transition"() nounwind {
entry:
  %local.m.1016 = alloca i64
  %local.r1.1017 = alloca i64
  %local.r2.1018 = alloca i64
  %local.r3.1019 = alloca i64
  %local.avg.1020 = alloca i64
  %local.ratio.1021 = alloca i64
  %t1022 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.204)
  %t1023 = ptrtoint ptr %t1022 to i64
  %t1024 = inttoptr i64 %t1023 to ptr
  call void @intrinsic_println(ptr %t1024)
  %t1025 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.205)
  %t1026 = ptrtoint ptr %t1025 to i64
  %t1027 = inttoptr i64 %t1026 to ptr
  call void @intrinsic_println(ptr %t1027)
  %t1028 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.206)
  %t1029 = ptrtoint ptr %t1028 to i64
  %t1030 = inttoptr i64 %t1029 to ptr
  call void @intrinsic_println(ptr %t1030)
  %t1031 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.207)
  %t1032 = ptrtoint ptr %t1031 to i64
  %t1033 = inttoptr i64 %t1032 to ptr
  call void @intrinsic_println(ptr %t1033)
  %t1034 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.208)
  %t1035 = ptrtoint ptr %t1034 to i64
  %t1036 = inttoptr i64 %t1035 to ptr
  call void @intrinsic_println(ptr %t1036)
  store i64 1, ptr %local.m.1016
  br label %loop34
loop34:
  %t1037 = load i64, ptr %local.m.1016
  %t1038 = icmp sle i64 %t1037, 20
  %t1039 = zext i1 %t1038 to i64
  %t1040 = icmp ne i64 %t1039, 0
  br i1 %t1040, label %body34, label %endloop34
body34:
  %t1041 = load i64, ptr %local.m.1016
  %t1042 = call i64 @"train_with_constraints"(i64 %t1041, i64 42)
  store i64 %t1042, ptr %local.r1.1017
  %t1043 = load i64, ptr %local.m.1016
  %t1044 = call i64 @"train_with_constraints"(i64 %t1043, i64 137)
  store i64 %t1044, ptr %local.r2.1018
  %t1045 = load i64, ptr %local.m.1016
  %t1046 = call i64 @"train_with_constraints"(i64 %t1045, i64 999)
  store i64 %t1046, ptr %local.r3.1019
  %t1047 = load i64, ptr %local.r1.1017
  %t1048 = load i64, ptr %local.r2.1018
  %t1049 = call i64 @"sx_f64_add"(i64 %t1047, i64 %t1048)
  %t1050 = load i64, ptr %local.r3.1019
  %t1051 = call i64 @"sx_f64_add"(i64 %t1049, i64 %t1050)
  %t1052 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.209)
  %t1053 = call i64 @"sx_f64_div"(i64 %t1051, i64 %t1052)
  store i64 %t1053, ptr %local.avg.1020
  %t1054 = load i64, ptr %local.m.1016
  %t1055 = call i64 @"sx_int_to_f64"(i64 %t1054)
  %t1056 = call i64 @f64_parse(ptr @.str.exp_structure_discovery.210)
  %t1057 = call i64 @"sx_f64_div"(i64 %t1055, i64 %t1056)
  store i64 %t1057, ptr %local.ratio.1021
  %t1058 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.211)
  %t1059 = ptrtoint ptr %t1058 to i64
  %t1060 = inttoptr i64 %t1059 to ptr
  call void @intrinsic_print(ptr %t1060)
  %t1061 = load i64, ptr %local.m.1016
  call void @print_i64(i64 %t1061)
  %t1062 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.212)
  %t1063 = ptrtoint ptr %t1062 to i64
  %t1064 = inttoptr i64 %t1063 to ptr
  call void @intrinsic_print(ptr %t1064)
  %t1065 = load i64, ptr %local.ratio.1021
  %t1066 = call i64 @"print_f64"(i64 %t1065)
  %t1067 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.213)
  %t1068 = ptrtoint ptr %t1067 to i64
  %t1069 = inttoptr i64 %t1068 to ptr
  call void @intrinsic_print(ptr %t1069)
  %t1070 = load i64, ptr %local.avg.1020
  %t1071 = call i64 @"print_f64"(i64 %t1070)
  %t1072 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.214)
  %t1073 = ptrtoint ptr %t1072 to i64
  %t1074 = inttoptr i64 %t1073 to ptr
  call void @intrinsic_println(ptr %t1074)
  %t1075 = load i64, ptr %local.m.1016
  %t1076 = add i64 %t1075, 2
  store i64 %t1076, ptr %local.m.1016
  br label %loop34
endloop34:
  %t1077 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.215)
  %t1078 = ptrtoint ptr %t1077 to i64
  %t1079 = inttoptr i64 %t1078 to ptr
  call void @intrinsic_println(ptr %t1079)
  %t1080 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.216)
  %t1081 = ptrtoint ptr %t1080 to i64
  %t1082 = inttoptr i64 %t1081 to ptr
  call void @intrinsic_println(ptr %t1082)
  %t1083 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.217)
  %t1084 = ptrtoint ptr %t1083 to i64
  %t1085 = inttoptr i64 %t1084 to ptr
  call void @intrinsic_println(ptr %t1085)
  %t1086 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.218)
  %t1087 = ptrtoint ptr %t1086 to i64
  %t1088 = inttoptr i64 %t1087 to ptr
  call void @intrinsic_println(ptr %t1088)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t1089 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.219)
  %t1090 = ptrtoint ptr %t1089 to i64
  %t1091 = inttoptr i64 %t1090 to ptr
  call void @intrinsic_println(ptr %t1091)
  %t1092 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.220)
  %t1093 = ptrtoint ptr %t1092 to i64
  %t1094 = inttoptr i64 %t1093 to ptr
  call void @intrinsic_println(ptr %t1094)
  %t1095 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.221)
  %t1096 = ptrtoint ptr %t1095 to i64
  %t1097 = inttoptr i64 %t1096 to ptr
  call void @intrinsic_println(ptr %t1097)
  %t1098 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.222)
  %t1099 = ptrtoint ptr %t1098 to i64
  %t1100 = inttoptr i64 %t1099 to ptr
  call void @intrinsic_println(ptr %t1100)
  %t1101 = call i64 @"test_constraint_graph"()
  %t1102 = call i64 @"test_hardness"()
  %t1103 = call i64 @"test_phase_transition"()
  %t1104 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.223)
  %t1105 = ptrtoint ptr %t1104 to i64
  %t1106 = inttoptr i64 %t1105 to ptr
  call void @intrinsic_println(ptr %t1106)
  %t1107 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.224)
  %t1108 = ptrtoint ptr %t1107 to i64
  %t1109 = inttoptr i64 %t1108 to ptr
  call void @intrinsic_println(ptr %t1109)
  %t1110 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.225)
  %t1111 = ptrtoint ptr %t1110 to i64
  %t1112 = inttoptr i64 %t1111 to ptr
  call void @intrinsic_println(ptr %t1112)
  %t1113 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.226)
  %t1114 = ptrtoint ptr %t1113 to i64
  %t1115 = inttoptr i64 %t1114 to ptr
  call void @intrinsic_println(ptr %t1115)
  %t1116 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.227)
  %t1117 = ptrtoint ptr %t1116 to i64
  %t1118 = inttoptr i64 %t1117 to ptr
  call void @intrinsic_println(ptr %t1118)
  %t1119 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.228)
  %t1120 = ptrtoint ptr %t1119 to i64
  %t1121 = inttoptr i64 %t1120 to ptr
  call void @intrinsic_println(ptr %t1121)
  %t1122 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.229)
  %t1123 = ptrtoint ptr %t1122 to i64
  %t1124 = inttoptr i64 %t1123 to ptr
  call void @intrinsic_println(ptr %t1124)
  %t1125 = call ptr @intrinsic_string_new(ptr @.str.exp_structure_discovery.230)
  %t1126 = ptrtoint ptr %t1125 to i64
  %t1127 = inttoptr i64 %t1126 to ptr
  call void @intrinsic_println(ptr %t1127)
  ret i64 0
}


; String constants
@.str.exp_structure_discovery.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.2 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_structure_discovery.3 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.4 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.5 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.6 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_structure_discovery.7 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.8 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.9 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.10 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.11 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_structure_discovery.12 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.13 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.14 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.15 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.16 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.17 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.18 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_structure_discovery.19 = private unnamed_addr constant [42 x i8] c"--- Exp 1: Constraint Graph Discovery ---\00"
@.str.exp_structure_discovery.20 = private unnamed_addr constant [21 x i8] c"  C1: x0→2, x1→3\00"
@.str.exp_structure_discovery.21 = private unnamed_addr constant [53 x i8] c"  C2: x1→1, x2→4  (shares x1 with C1, CONFLICTS)\00"
@.str.exp_structure_discovery.22 = private unnamed_addr constant [60 x i8] c"  C3: x2→2, x3→1  (shares x2 with C2, disjoint from C1)\00"
@.str.exp_structure_discovery.23 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_structure_discovery.24 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.25 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.29 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.30 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.31 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.33 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.34 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.35 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.36 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.37 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.38 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.39 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.40 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.41 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.42 = private unnamed_addr constant [44 x i8] c"  Gradient cosines (interaction structure):\00"
@.str.exp_structure_discovery.43 = private unnamed_addr constant [19 x i8] c"    cos(C1, C2) = \00"
@.str.exp_structure_discovery.44 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.45 = private unnamed_addr constant [48 x i8] c"  CONFLICT (shared variable, different targets)\00"
@.str.exp_structure_discovery.46 = private unnamed_addr constant [14 x i8] c"  COOPERATIVE\00"
@.str.exp_structure_discovery.47 = private unnamed_addr constant [19 x i8] c"    cos(C1, C3) = \00"
@.str.exp_structure_discovery.48 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_structure_discovery.49 = private unnamed_addr constant [35 x i8] c"  ORTHOGONAL (no shared variables)\00"
@.str.exp_structure_discovery.50 = private unnamed_addr constant [10 x i8] c"  COUPLED\00"
@.str.exp_structure_discovery.51 = private unnamed_addr constant [19 x i8] c"    cos(C2, C3) = \00"
@.str.exp_structure_discovery.52 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.53 = private unnamed_addr constant [48 x i8] c"  CONFLICT (shared variable, different targets)\00"
@.str.exp_structure_discovery.54 = private unnamed_addr constant [14 x i8] c"  COOPERATIVE\00"
@.str.exp_structure_discovery.55 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_structure_discovery.56 = private unnamed_addr constant [69 x i8] c"  PREDICTION: C1↔C2 conflict, C1↔C3 orthogonal, C2↔C3 conflict\00"
@.str.exp_structure_discovery.57 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.58 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_structure_discovery.59 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.60 = private unnamed_addr constant [66 x i8] c"  CONFIRMED: Matrix correctly discovers constraint graph topology\00"
@.str.exp_structure_discovery.61 = private unnamed_addr constant [47 x i8] c"  PARTIAL: C2↔C3 not conflicting as expected\00"
@.str.exp_structure_discovery.62 = private unnamed_addr constant [46 x i8] c"  PARTIAL: C1↔C3 not orthogonal as expected\00"
@.str.exp_structure_discovery.63 = private unnamed_addr constant [38 x i8] c"  UNEXPECTED: C1↔C2 should conflict\00"
@.str.exp_structure_discovery.64 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_structure_discovery.65 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_structure_discovery.66 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_structure_discovery.67 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.68 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.69 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_structure_discovery.70 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.71 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.72 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.73 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.74 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.75 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.76 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.77 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.78 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_structure_discovery.79 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.80 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.81 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.82 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.83 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.84 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_structure_discovery.85 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.86 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.87 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_structure_discovery.88 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.89 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.90 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_structure_discovery.91 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.92 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.93 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_structure_discovery.94 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.95 = private unnamed_addr constant [47 x i8] c"--- Exp 2: Problem Hardness Classification ---\00"
@.str.exp_structure_discovery.96 = private unnamed_addr constant [41 x i8] c"  Easy: convex quadratic, unique minimum\00"
@.str.exp_structure_discovery.97 = private unnamed_addr constant [48 x i8] c"  Hard: non-convex Rastrigin, many local minima\00"
@.str.exp_structure_discovery.98 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_structure_discovery.99 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_structure_discovery.100 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.101 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.102 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.103 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_structure_discovery.104 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_structure_discovery.105 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.106 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.107 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.108 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_structure_discovery.109 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_structure_discovery.110 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.111 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.112 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.113 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_structure_discovery.114 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_structure_discovery.115 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.116 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.117 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.118 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_structure_discovery.119 = private unnamed_addr constant [23 x i8] c"  Easy problem loss:  \00"
@.str.exp_structure_discovery.120 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_structure_discovery.121 = private unnamed_addr constant [23 x i8] c"  Hard problem loss:  \00"
@.str.exp_structure_discovery.122 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_structure_discovery.123 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_structure_discovery.124 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.125 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.126 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.127 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_structure_discovery.128 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_structure_discovery.129 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.130 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.131 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.132 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_structure_discovery.133 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_structure_discovery.134 = private unnamed_addr constant [33 x i8] c"  Partial Opposition Diagnostic:\00"
@.str.exp_structure_discovery.135 = private unnamed_addr constant [60 x i8] c"  If skeptical objective helps → problem has local optima\00"
@.str.exp_structure_discovery.136 = private unnamed_addr constant [48 x i8] c"  If it doesn't help → problem is convex-like\00"
@.str.exp_structure_discovery.137 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_structure_discovery.138 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.139 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.140 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_structure_discovery.141 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.142 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_structure_discovery.143 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_structure_discovery.144 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.145 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_structure_discovery.146 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.147 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.148 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_structure_discovery.149 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.150 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.151 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.152 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.153 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_structure_discovery.154 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.155 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.156 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.157 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.158 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_structure_discovery.159 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.160 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.161 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_structure_discovery.162 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.163 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_structure_discovery.164 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.165 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_structure_discovery.166 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_structure_discovery.167 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_structure_discovery.168 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.169 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_structure_discovery.170 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.171 = private unnamed_addr constant [26 x i8] c"  Hard without skeptic:  \00"
@.str.exp_structure_discovery.172 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_structure_discovery.173 = private unnamed_addr constant [26 x i8] c"  Hard WITH skeptic:     \00"
@.str.exp_structure_discovery.174 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_structure_discovery.175 = private unnamed_addr constant [60 x i8] c"  FINDING: Skeptic HELPED → non-convex structure detected\00"
@.str.exp_structure_discovery.176 = private unnamed_addr constant [64 x i8] c"  FINDING: Skeptic didn't help → structure may be convex-like\00"
@.str.exp_structure_discovery.177 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_structure_discovery.178 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.179 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.180 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.181 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.182 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.183 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.184 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.185 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.186 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.187 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.188 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.189 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.190 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_structure_discovery.191 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_structure_discovery.192 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.193 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.194 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.195 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_structure_discovery.196 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_structure_discovery.197 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_structure_discovery.198 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_structure_discovery.199 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_structure_discovery.200 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.201 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_structure_discovery.202 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_structure_discovery.203 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_structure_discovery.204 = private unnamed_addr constant [55 x i8] c"--- Exp 3: Phase Transition via Constraint Density ---\00"
@.str.exp_structure_discovery.205 = private unnamed_addr constant [48 x i8] c"  4 variables, increasing number of constraints\00"
@.str.exp_structure_discovery.206 = private unnamed_addr constant [48 x i8] c"  Track avg residual (proxy for satisfiability)\00"
@.str.exp_structure_discovery.207 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_structure_discovery.208 = private unnamed_addr constant [45 x i8] c"  M (constraints)   M/N ratio   Avg Residual\00"
@.str.exp_structure_discovery.209 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_structure_discovery.210 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_structure_discovery.211 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_structure_discovery.212 = private unnamed_addr constant [17 x i8] c"                \00"
@.str.exp_structure_discovery.213 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_structure_discovery.214 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_structure_discovery.215 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_structure_discovery.216 = private unnamed_addr constant [47 x i8] c"  If residual jumps sharply at some M/N ratio,\00"
@.str.exp_structure_discovery.217 = private unnamed_addr constant [49 x i8] c"  that's the phase transition from easy to hard.\00"
@.str.exp_structure_discovery.218 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_structure_discovery.219 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_structure_discovery.220 = private unnamed_addr constant [45 x i8] c"  STRUCTURE DISCOVERY VIA INTERACTION MATRIX\00"
@.str.exp_structure_discovery.221 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_structure_discovery.222 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_structure_discovery.223 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_structure_discovery.224 = private unnamed_addr constant [40 x i8] c"  The interaction matrix is a PROBE for\00"
@.str.exp_structure_discovery.225 = private unnamed_addr constant [40 x i8] c"  mathematical structure. It discovers:\00"
@.str.exp_structure_discovery.226 = private unnamed_addr constant [38 x i8] c"  - Constraint graph topology (Exp 1)\00"
@.str.exp_structure_discovery.227 = private unnamed_addr constant [29 x i8] c"  - Problem hardness (Exp 2)\00"
@.str.exp_structure_discovery.228 = private unnamed_addr constant [30 x i8] c"  - Phase transitions (Exp 3)\00"
@.str.exp_structure_discovery.229 = private unnamed_addr constant [35 x i8] c"  All without solving the problem.\00"
@.str.exp_structure_discovery.230 = private unnamed_addr constant [45 x i8] c"============================================\00"
